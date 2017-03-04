#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import sys
import pefile

import os

pe = pefile.PE(sys.argv[1])
for section in pe.sections:
    name = section.Name.rstrip(b'\0').decode("ascii")
    if name != ".rsrc":
        continue
    with open(sys.argv[2], "wb") as f:
        f.write(section.get_data())
    break
