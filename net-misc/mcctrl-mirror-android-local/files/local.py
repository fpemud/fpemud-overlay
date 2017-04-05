#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import threading
from helpers.git_mirror_local import Local


class MirrorRefreshThread(threading.Thread):

    def __init__(self, mirror_cb):
        threading.Thread.__init__(self)
        self.mirror_cb = mirror_cb

    def run(self):
        self.mirror_cb(_MirrorObject())


class _MirrorObject:

    def __init__(self):
        self.name = "local"
        self.helpers_needed = ["git_mirror_local"]
        self.api = None
        self.impl = None

    def init2(self, api):
        self.api = api
        self.impl = Local("android")

    @property
    def capabilities(self):
        return [
            "new",
            "delete",
            "import"
            "pull",
            "push",
        ]

    def get_repo_list(self):
        return self.impl.get_repo_list()

    def has_repo(self, repo_id):
        return self.impl.has_repo()

    def get_repo_url(self, repo_id, for_write=False):
        return self.impl.get_repo_url(repo_id, for_write)

    def new_repo(self, repo_id):
        return self.impl.new_repo(repo_id)

    def delete_repo(self, repo_id):
        return self.impl.delete_repo(repo_id)

    def import_repo_from(self, repo_id, url):
        return self.impl.import_repo_from(repo_id, url)

    def pull_repo_from(self, repo_id, url):
        return self.impl.pull_repo_from(repo_id, url)

    def push_repo_to(self, repo_id, url):
        return self.impl.push_repo_to(repo_id, url)
