import bz2
import io
import os
import re
import shutil
import tarfile
from multiprocessing import Pool
from urllib.parse import urljoin, urlparse
from urllib.request import urlopen


class ProgressFileObject(io.FileIO):
    def __init__(self, path, total, prefix, idx, *args, **kwargs):
        io.FileIO.__init__(self, path, *args, **kwargs)
        self.total = total
        self.current = 0
        self.prefix = prefix
        self.idx = idx

    def read(self, size):
        self.progress(size)
        return io.FileIO.read(self, size)

    def write(self, b):
        self.progress(len(b))
        return io.FileIO.write(self, b)

    def progress(self, count):
        # change cursor to line idx
        print('\033[%d;0H' % self.idx)

        self.current += count
        bar_len = 20
        filled_len = int(round(bar_len * self.current // self.total))
        percent = round(100.0 * self.current / float(self.total), 1)
        bar = '=' * filled_len + '-' * (bar_len - filled_len)

        print('%s: [%s] %s%% (%3dMB / %3dMB)' % (
                self.prefix,
                bar, percent,
                self.current / (1024.0 ** 2),
                self.total / (1024.0 ** 2)
                ), end='\r')


def get_links(url, filters):
    links = []
    response = urlopen(url)
    html = response.read().decode('utf-8')

    urls = re.findall(r'href=[\'"]?([^\'" >]+)', html)

    for link in urls:
        if all(filter_str in link for filter_str in filters):
            links.append(urljoin(url, link))

    return links


def download(url, destination, idx):
    label = 'Download - '
    label += ' '.join(os.path.basename(urlparse(url).path).split('-')[:2])
    filename = os.path.join(destination, os.path.basename(urlparse(url).path))

    with urlopen(url) as response:
        size = int(response.info().get('Content-Length'))
        p = ProgressFileObject(filename, size, label, idx, mode='wb')
        shutil.copyfileobj(response, p)

    return filename


def extract(filename, destination, idx):
    label = 'Extract  - '
    label += ' '.join(os.path.basename(filename).split('-')[:2])

    with bz2.BZ2File(filename, 'r') as data:
        size = os.fstat(data.fileno()).st_size
        fobj = ProgressFileObject(filename, size, label, idx)

        with tarfile.open(fileobj=fobj) as tar:
            tar.extractall(destination)


def cleanup(filenames):
    for filename in filenames:
        old_dirname = '.'.join(filename.split('.')[:2])
        final_dirname = '-'.join(filename.split('-')[:2])

        try:
            # remove compressed files
            os.remove(filename)
        except OSError:
            pass

        # remove old folders
        shutil.rmtree(final_dirname, ignore_errors=True)
        # rename folders
        os.rename(old_dirname, final_dirname)


def main():
    # clear screen
    print('\033[2J')

    url = 'https://builder.blender.org/download'
    filters = ['linux', 'x86_64']
    destination = '/home/paulo/Software'

    links = get_links(url, filters)
    idx = len(links)

    # Download
    args = list(zip(
        links, [destination] * idx, [x + 1 for x in range(idx)])
    )
    with Pool() as p:
        filenames = p.starmap(download, args)

    # Extract
    args = list(zip(
        filenames, [destination] * idx, [x + 1 for x in range(idx, idx * 2)])
    )
    with Pool() as p:
        p.starmap(extract, args)

    cleanup(filenames)

    print('\n' * idx)


if __name__ == '__main__':
    main()
