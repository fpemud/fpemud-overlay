#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

from mc_util import McUtil


class HelperObject:

    def __init__(self, param):
        pass

    def check_source(self, source):
        if not hasattr(source, "capabilities"):
            raise Exception("invalid source %s: no capabilities property" % (source))
        self._check_method("source", source, None, "has_repo")
        self._check_method("source", source, "list-all", "get_all_repos")
        self._check_method("source", source, "list-important", "get_important_repos")
        self._check_method("source", source, "pull", "pull_repo_from")
        self._check_method("source", source, "push", "push_repo_to")
        self._check_method("source", source, "url_for_read", "get_repo_url_for_read")
        self._check_method("source", source, "url_for_write", "get_repo_url_for_write")

    def check_mirror(self, mirror):
        if not hasattr(mirror, "capabilities"):
            raise Exception("invalid mirror %s: no capabilities property" % (mirror))
        self._check_method("mirror", mirror, None, "get_repo_list")
        self._check_method("mirror", mirror, None, "has_repo")
        self._check_method("mirror", mirror, "new", "new_repo")
        self._check_method("mirror", mirror, "delete", "delete_repo")
        self._check_method("mirror", mirror, "import", "import_repo_from")
        self._check_method("mirror", mirror, "pull", "pull_repo_from")
        self._check_method("mirror", mirror, "push", "push_repo_to")
        self._check_method("mirror", mirror, "url_for_read", "get_repo_url_for_read")
        self._check_method("mirror", mirror, "url_for_write", "get_repo_url_for_write")

    def _check_method(self, check_type, obj, cap_name, method_name):
        if cap_name is None or cap_name in obj.capabilities:
            if not McUtil.is_method(obj, method_name):
                raise Exception("invalid %s %s: no %s method" % (check_type, obj.name, method_name))


class GitStorageSyncFlow:

    def __init__(self, source, mirror_list):
        self.source = source
        self.mirror_list = mirror_list

        self.progressForDelete = 20
        self.progressForSync = 40
        self.progressForAdd = 40

        #self.logFile = os.path.join(self.api.getTmpDir(), McUtil.objpath(self) + "." + str(datetime.now()))
        self.bStop = False
        self.progress = 0

    def get_progress(self):
        return self.progress

    def run(self):
        # delete
        for i in range(0, len(self.mirror_list)):
            tlist = self.mirror_list[i].get_repo_list()
            for j in range(0, len(tlist)):
                if self.bStop:
                    return
                repo_id = tlist[j]
                if not self.source.has_repo(repo_id):
                    self.mirror_list[i].delete_repo(repo_id)
                self.progress = self.progressForDelete * i // len(self.mirroList) + self.progressForDelete * (j + 1) // len(tlist) // len(self.mirroList)

        self.progress = self.progressForDelete

        # sync
        for i in range(0, len(self.mirror_list)):
            m = self.mirror_list[i]
            tlist = m.get_repo_list()
            for j in range(0, len(tlist)):
                if self.bStop:
                    return
                repo_id = tlist[j]
                if "pull" in m.capabilities() and "url_for_read" in self.source.capabilities():
                    try:
                        m.pull_repo_from(repo_id, self.source.get_repo_url(repo_id))
                    except:
                        pass
                elif "push" in self.source.capabilities() and "url_for_write" in m.capabilities():
                    try:
                        self.source.push_repo_to(repo_id, m.get_repo_url(repo_id, for_write=True))
                    except:
                        pass
                else:
                    assert False
                self.progress = self.progressForDelete + self.progressForSync * i // len(self.mirroList) + self.progressForSync * (j + 1) // len(tlist) // len(self.mirroList)

        self.progress = self.progressForDelete + self.progressForSync

        # add
        repo_id_list = []
        if "list-all" in self.source.capabilities():
            repo_id_list = self.source.get_all_repos()
        elif "list-important" in self.source.capabilities():
            repo_id_list = self.source.get_important_repos()
        else:
            assert False
        for i in range(0, len(self.mirror_list)):
            m = self.mirror_list[i]
            for j in range(0, len(repo_id_list)):
                if self.bStop:
                    return
                repo_id = repo_id_list[j]
                if not m.has_repo(repo_id):
                    if "import" in m.capabilities() and "url_for_read" in self.source.capabilities():
                        try:
                            m.import_repo_from(repo_id, self.source.get_repo_url(repo_id))
                        except:
                            pass
                    elif "new" in m.capabilities() and "pull" in m.capabilities() and "url_for_read" in self.source.capabilities():
                        try:
                            m.new_repo(repo_id)
                            m.pull_repo_from(repo_id, self.source.get_repo_url(repo_id))
                        except:
                            pass
                    else:
                        assert False
                self.progress = self.progressForDelete + self.progressForSync + self.progressForAdd * i // len(self.mirroList) + self.progressForAdd * (j + 1) // len(self.key_repo_id_list) // len(self.mirroList)

        self.progress = self.progressForDelete + self.progressForSync + self.progressForAdd

    def stop(self):
        assert not self.bStop
        self.bStop = True


class _SourceInterface:

    @property
    def capabilities(self):
        # "list-all"              :
        # "list-important"        :
        # "pull"                  :
        # "push"                  :
        # "url_for_read"          :
        # "url_for_write"         :
        assert False

    def get_all_repos(self):
        assert False

    def get_important_repos(self):
        assert False

    def has_repo(self, repo_id):
        assert False

    def pull_repo_from(self, repo_id, url):
        assert False

    def push_repo_to(self, repo_id, url):
        assert False

    def get_repo_url_for_read(self, repo_id):
        assert False

    def get_repo_url_for_write(self, repo_id):
        assert False


class _MirrorInterface:

    @property
    def capabilities(self):
        # "new"                   :
        # "delete"                :
        # "import"                :
        # "pull"                  :
        # "push"                  :
        # "url_for_read"          :
        # "url_for_write"         :
        # "hook"                  :
        # "hook-target"           :
        assert False

    def get_repo_list(self):
        assert False

    def has_repo(self, repo_id):
        assert False

    def new_repo(self, repo_id):
        assert False

    def delete_repo(self, repo_id):
        assert False

    def get_repo_url_for_read(self, repo_id):
        assert False

    def get_repo_url_for_write(self, repo_id):
        assert False

    def import_repo_from(self, repo_id, url):
        assert False

    def pull_repo_from(self, repo_id, url):
        assert False

    def push_repo_to(self, repo_id, url):
        assert False
