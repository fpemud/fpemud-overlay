#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import threading
import urllib.request
from xml.etree import ElementTree


class MirrorRefreshThread(threading.Thread):

    def __init__(self, mirror_cb):
        threading.Thread.__init__(self)
        self.mirror_cb = mirror_cb

    def run(self):
        url = "https://api.gentoo.org/mirrors/rsync.xml"        # from app-portage/mirrorselect-2.2.2
        text = urllib.request.urlopen(url).read().decode("utf-8")
        for mirrorgroup in ElementTree.XML(text):
            for mirror in mirrorgroup:
                obj = _MirrorObject()
                for e in mirror:
                    if e.tag == 'name':
                        obj.name = e.text.replace("\n", "")
                    if e.tag == 'uri':
                        if e.get("protocols") != "rsync":
                            continue
                        if e.get("ipv4") != "y":
                            continue
                        obj.uri = e.text
                self.mirror_cb(obj)


class _MirrorObject:

    def __init__(self):
        self.name = None            # to be filled in MirrorObjectFactory
        self.country = None         # to be filled in MirrorObjectFactory
        self.uri = None             # to be filled in MirrorObjectFactory
        self.api = None

    def init2(self, api):
        self.api = api

    @property
    def protocols(self):
        return [
            "rsync",
        ]

    @property
    def sub_directories(self):
        return [
            "/pub/linux/kernel",
        ]

    @property
    def capabilities(self):
        return [
            "external",
        ]

    def get_sub_directory(self, protocol, domain, sub_directory, postfix):
        if sub_directory == "/pub/linux/kernel":
            return (protocol, "mirrors.tuna.tsinghua.edu.cn", "kernel", postfix)
        else:
            assert False


class _MirrorInterface:

    @property
    def protocols(self):
        # "http"               :
        # "https"              :
        # "ftp"                :
        # "ftps"               :
        # "rsync"              :
        assert False

    @property
    def sub_directories(self):
        assert False
