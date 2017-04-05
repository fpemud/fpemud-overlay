#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import os
import time
import fnmatch
import threading
from datetime import datetime
from github3 import GitHub
from mc_util import McUtil
from helpers.git_storage_sync_flow import GitStorageSyncFlow


class SourceObject:

    def __init__(self):
        self.name = "github.com"
        self.helpers_needed = ["git_storage_sync_flow"]
        self.githubApiInterval = 30         # in seconds, so that github won't ban us

        # self.lastRun = None
        self.logFile = None

        self.api = None
        self.anon = None

    def init2(self, api):
        self.api = api
        self.anon = GitHub()

    def getSyncTimeRange(self):
        assert False

    def getSyncThread(self):
        # if self.lastRun is not None and datetime.now() - self.lastRun < datetime.timedelta(hours=1):
        #     return None
        return _SyncThread(self)

    @property
    def protocols(self):
        return [
            "git",
            "ssh",
            "http",
            "https",
        ]

    @property
    def capabilities(self):
        return [
            "list-important",
            "url-for-read",
            "url-for-write",
        ]

    def get_important_repos(self):
        # get key repository list configuration
        keyRepoList = []
        keyRepoListFile = os.path.join(self.api.getCfgDir(), "key-repo.list")
        if os.path.exists(keyRepoListFile):
            with open(keyRepoListFile, "r") as f:
                for line in f.read().split("\n"):
                    if line.startswith("#") or line.strip(" ") == "":
                        continue
                    keyRepoList.append(McUtil.splitToTuple(line, "/"))

        # expand key repository list
        realKeyRepoList = []
        for userName, repoName in keyRepoList:
            if "*" in repoName:
                for repo in self.anon.iter_user_repos(userName):
                    repoName2 = repo.full_name.split("/")[1]
                    if fnmatch.fnmatch(repoName2, repoName):
                        realKeyRepoList.append("%s/%s" % (userName, repoName2))
                time.sleep(self.githubApiInterval)
            else:
                realKeyRepoList.append("%s/%s" % (userName, repoName))

        return realKeyRepoList

    def has_repo(self, repo_id):
        if hasattr(self, "_has_repo_last_run"):
            timediff = datetime.now() - self._has_repo_last_run
            if timediff < datetime.timedelta(seconds=self.githubApiInterval):
                wait_seconds = (datetime.timedelta(seconds=self.githubApiInterval) - timediff).seconds
                time.sleep(wait_seconds)

        ret = self.anon.repository(*self._split_repo_id(repo_id)) is not None
        self._has_repo_last_run = datetime.now()
        return ret

    def get_repo_url(self, repo_id, for_write=False):
        if not for_write:
            return "git://github.com/%s" % (repo_id)
        else:
            return "https://github.com/%s" % (repo_id)

    def _split_repo_id(self, repo_id):
        t = repo_id.split("/")
        assert len(t) == 2
        return (t[0], t[1])


class _SyncThread(threading.Thread):

    def __init__(self, pObj):
        super(_SyncThread, self).__init__()

        self.pObj = pObj
        self.userList = []          # (username, password)
        self.keyRepoList = []
        self.bStop = False
        self.flowObj = None

        self.progressForInit = 20
        self.progress = None

    def get_progress(self):
        if self.flowObj is None:
            return self.progress
        else:
            return self.progress + self.flowObj.get_progress() * (100 - self.progressForInit) / 100

    def start(self):
        self.progress = 0
        super(_SyncThread, self).start()

    def stop(self):
        self.bStop = True
        if self.flowObj is not None:
            self.flowObj.stop()

    def run(self):
        self.progress = 0

        # sync user information to mirrors
        pass

        self.progress = self.progressForInit

        # sync repositories
        self.flowObj = GitStorageSyncFlow(self.pObj, self.pObj.api.getMyMirrors())
        self.flowObj.run()

    def _loadConfig(self):
        # reload config files
        userListFile = os.path.join(self.pObj.api.getCfgDir(), "user.list")
        if os.path.exists(userListFile):
            with open(userListFile, "r") as f:
                for line in f.read().split("\n"):
                    if line.startswith("#") or line.strip(" ") == "":
                        continue
                    self.userList.append(McUtil.splitToTuple(line, " "))
