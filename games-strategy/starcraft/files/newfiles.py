#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import os
import re
import sys
import shutil

listfn = sys.argv[1]
srcdir = sys.argv[2]
dstdir = sys.argv[3]

with open(listfn, "r") as f:
    for line in f.read().split("\n"):
        line = line.rstrip()
        if line == "" or line.startswith("#"):
            continue
        ret = re.split("\t+", line)
        dstfile = ret[0]
        srcfile = ret[1]
        if os.path.dirname(dstfile) != "" and not os.path.exists(os.path.join(dstdir, os.path.dirname(dstfile))):
            os.makedirs(os.path.join(dstdir, os.path.dirname(dstfile)))
        shutil.copyfile(os.path.join(srcdir, srcfile), os.path.join(dstdir, dstfile))
