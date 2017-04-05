#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-


class SourceObject:

    def __init__(self):
        self.name = "kernel.org"
        self.url = [
            "https://www.kernel.org",
            "https://cdn.kernel.org",
        ]

        self.api = None

    def init2(self, api):
        self.api = api
        assert all(set(m.protocols) == set(self.protocols) for m in self.api.getMyMirrors())

    def getSyncTimeRange(self):
        assert False

    def getSyncThread(self):
        return None

    @property
    def protocols(self):
        return [
            "http",
            "https",
        ]

    @property
    def capabilities(self):
        return [
            "rsync-pull-server",
            "download-server",
        ]

    def get_rsync_pull_server_url(self):
        return "rsync://rsync.kernel.org/pub"

    def get_download_server_url(self):
        return "https://www.kernel.org/pub"
