#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import threading


class MirrorRefreshThread(threading.Thread):

    def __init__(self, mirror_cb):
        threading.Thread.__init__(self)
        self.mirror_cb = mirror_cb

    def run(self):
        self.mirror_cb(_MirrorObject())


class _MirrorObject:

    def __init__(self):
        self.name = "tuna"
        self.api = None

    def init2(self, api):
        self.api = api

    @property
    def protocols(self):
        return [
            "http",
            "https",
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
