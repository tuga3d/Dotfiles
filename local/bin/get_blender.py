#!/usr/bin/python3

import urllib.request
import re
import tarfile
import shutil
import os

url = 'https://builder.blender.org/download/'
dest_folder = '/mnt/work/software/'


def get_links():
    links = []
    response = urllib.request.urlopen(url)
    data = response.read().decode('utf-8')

    link_regex = re.compile('href="((blender.*linux.*x86_64.*?))"')

    for link in link_regex.findall(data):
        links.append(link[0])

    return links


def download_links(links):
    filenames = []
    for link in links:
        folder = os.path.join(dest_folder, link)
        print('Downloading --> ', link)
        filename = urllib.request.urlretrieve(url + link, folder)[0]
        filenames.append(filename)
    return filenames


def extract_files(filename_list):
    for filename in filename_list:
        print('Extracting --> ', filename)
        with tarfile.open(filename, 'r:bz2') as compressed_file:
            compressed_file.extractall(dest_folder)


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
    links = get_links()
    filenames = download_links(links)
    extract_files(filenames)
    cleanup(filenames)


if __name__ == '__main__':
    main()
