#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-


class SourceObject:

    def __init__(self):
        self.name = "rsync.gentoo.org"
        self.api = None

    def init2(self, api):
        self.api = api

    def getSyncTimeRange(self):
        assert False

    def getSyncThread(self):
        return None

    @property
    def protocols(self):
        return [
            "rsync",
        ]

    @property
    def capabilities(self):
        return [
        ]
