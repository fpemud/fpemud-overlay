#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import threading
import lxml.html
import urllib.request
from datetime import datetime
from helpers.git_storage_sync_flow import GitStorageSyncFlow


class SourceObject:

    def __init__(self):
        self.name = "android.googlesource.com"
        self.helpers_needed = ["git_storage_sync_flow"]

        self.url = "https://android.googlesource.com"

        self.api = None
        self.repoListCache = None
        self.repoListCacheTime = None
        self.logFile = None

    def init2(self, api):
        self.api = api

    def getSyncTimeRange(self):
        assert False

    def getSyncThread(self):
        # if self.lastRun is not None and datetime.now() - self.lastRun < datetime.timedelta(hours=1):
        #     return None
        return _SyncThread(self)

    @property
    def capabilities(self):
        return [
            "list-all",
            "url-for-read",
            "url-for-write",
        ]

    def get_all_repos(self):
        self._refreshRepoListCache()
        return self.repoListCache

    def has_repo(self, repo_id):
        self._refreshRepoListCache()
        return (repo_id in self.repoListCache)

    def get_repo_url(self, repo_id, for_write=False):
        return "%s/%s" % (self.url, repo_id)

    def _refreshRepoListCache(self):
        if self.repoListCacheTime is None or datetime.now() - self.repoListCacheTime >= datetime.timedelta(hours=1):
            resp = urllib.request.urlopen(self.url)
            root = lxml.html.parse(resp)
            elems = root.xpath(".//span[@class='RepoList-itemName']")
            self.repoListCache - [x.text for x in elems]
            self.repoListCacheTime = datetime.now()
        return self.repoListCache


class _SyncThread(threading.Thread):

    def __init__(self, pObj):
        super(_SyncThread, self).__init__()
        self.pObj = pObj
        self.flowObj = None

    def get_progress(self):
        if self.flowObj is None:
            return 0
        else:
            return self.flowObj.get_progress()

    def start(self):
        self.progress = 0
        super(_SyncThread, self).start()

    def stop(self):
        if self.flowObj is not None:
            self.flowObj.stop()

    def run(self):
        # sync repositories
        self.flowObj = GitStorageSyncFlow(self.pObj, self.pObj.api.getMyMirrors())
        self.flowObj.run()
