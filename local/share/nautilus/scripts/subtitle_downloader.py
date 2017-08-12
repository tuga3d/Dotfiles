#!/usr/bin/env python3

import hashlib
import os
import sys
import subprocess
import urllib.request


def get_hash(file_path):
    read_size = 64 * 1024
    with open(file_path, 'rb') as f:
        data = f.read(read_size)
        f.seek(-read_size, os.SEEK_END)
        data += f.read(read_size)
    return hashlib.md5(data).hexdigest()


def subtitle_downloader(file_path):
    filename, extension = os.path.splitext(file_path)
    language = 'pt'
    base_url = 'http://api.thesubdb.com/'
    action = '?action=download&hash=' + get_hash(file_path)
    url = base_url + action + '&language=' + language
    headers = {'User-Agent': 'SubDB/1.0 (subtitledownloader/1.0; '
                             'http://github.com/tuga3d/subtitledownloader'}

    try:
        req = urllib.request.Request(url, None, headers)

        with urllib.request.urlopen(req) as response:
            page = response.read()

        with open(filename + '.srt', 'wb') as subtitle:
            subtitle.write(page)

        subprocess.call(['notify-send',
                         'Subtitle Downloader',
                         'Subtitle Downloaded!'])

    except Exception as e:
        subprocess.call(['notify-send', '-i', 'dialog-error',
                         'Subtitle Downloader',
                         str(e)])


def main():
    subtitle_downloader(sys.argv[1])


if __name__ == '__main__':
    main()

