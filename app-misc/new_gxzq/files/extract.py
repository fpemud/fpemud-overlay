#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import os
import sys
import zlib
import magic
import pefile
import struct


hflag = "TDX"
hfn = "xieyi.txt"

# filename length     4
# unknown             2
# file size           4
# compressed size     4
# unknown             4
# unknown             4, always 0x00000000
header_fmt = "=IHIIHHI"
header_len = struct.calcsize(header_fmt)


def get_compressed_data(filename):
    pe = pefile.PE(filename)
    for section in pe.sections:
        name = section.Name.rstrip(b'\0').decode("ascii")
        if name == ".rsrc":
            return section.get_data()
    raise Exception("can not get compressed data")


def extract(data, outdir):
    global hflag, hfn, header_fmt, header_len

    # find global flag
    start = data.index(hflag.encode("ascii"))
    data = data[start + len(hflag.encode("ascii")):]

    # find the first file and jump over it
    start = data.index(hfn.encode("ascii")) - header_len
    data = data[start:]
    header = struct.unpack(header_fmt, data[:header_len])
    data = data[header_len + header[0] + header[3]:]

    # extract
    extract_dir(data, 0, outdir)


def extract_dir(data, start, outdir, file_number=65536, dir_number=65536):
    global header_fmt, header_len

    orig_start = start
    while (file_number > 0 or dir_number > 0) and start < len(data):
        header = struct.unpack(header_fmt, data[start:start+header_len])
        start += header_len

        filename = data[start:start+header[0]]
        if b'\x00' in filename:
            # this means end too
            break
        filename = filename.decode("ascii")
        start += header[0]

        if magic.detect_from_content(data[start:start+header[3]]).mime_type != "application/zlib":
            # dir
            if dir_number == 0:
                raise Exception("invalid directory number for directory \"%s\"" % (outdir))
            n_file_number = header[3] // 0x10000
            n_dir_number = header[3] & 0xffff
            n_path = os.path.join(outdir, filename)
            os.mkdir(n_path)
            start += extract_dir(data, start, n_path, n_file_number, n_dir_number)
            dir_number -= 1
        else:
            # file
            if file_number == 0:
                raise Exception("invalid file number for directory \"%s\"" % (outdir))
            filedata = data[start:start+header[3]]
            start += header[3]
            with open(os.path.join(outdir, filename), "wb") as f:
                f.write(zlib.decompress(filedata))
            file_number -= 1

    return start - orig_start


if __name__ == "__main__":
    srcfile = sys.argv[1]
    dstdir = sys.argv[2]
    data = get_compressed_data(srcfile)
    extract(data, dstdir)
