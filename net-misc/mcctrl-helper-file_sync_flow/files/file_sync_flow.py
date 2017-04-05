#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

from mc_util import McUtil


class HelperObject:

    def __init__(self, param):
        pass

    def check_source(self, source):
        self._check_common("source", source)

    def check_mirror(self, mirror):
        self._check_common("mirror", mirror)

    def _check_common(self, check_type, obj):
        if not hasattr(obj, "capabilities"):
            raise Exception("invalid %s %s: no capabilities property" % (check_type, obj))
        self._check_method(check_type, obj, "rsync-push-server", "get_rsync_push_server_url")
        self._check_method(check_type, obj, "rsync-push", "rsync_push")
        self._check_method(check_type, obj, "rsync-pull-server", "get_rsync_pull_server_url")
        self._check_method(check_type, obj, "rsync-pull", "rsync_pull")
        self._check_method(check_type, obj, "download-server", "get_download_server_url")
        self._check_method(check_type, obj, "download", "download")
        self._check_method(check_type, obj, "upload-server", "get_upload_server_url")
        self._check_method(check_type, obj, "upload", "upload")

    def _check_method(self, check_type, obj, cap_name, method_name):
        if cap_name is None or cap_name in obj.capabilities:
            if not McUtil.is_method(obj, method_name):
                raise Exception("invalid %s %s: no %s method" % (check_type, obj.name, method_name))


class FileStorageSyncFlow:

    def __init__(self, source, mirror_list):
        self.source = source
        self.mirror_list = mirror_list

        #self.logFile = os.path.join(self.api.getTmpDir(), McUtil.objpath(self) + "." + str(datetime.now()))
        self.bStop = False
        self.progress = 0

    def get_progress(self):
        return self.progress

    def run(self):
        for i in range(0, len(self.mirror_list)):
            m = self.mirror_list[i]
            if self.bStop:
                return
            if "external" in m.capabilities:
                assert len(m.capabilities) == 1
            elif "rsync-pull-server" in self.source.capabilities and "rsync-pull" in m.capabilities:
                m.rsync_pull(self.source.get_rsync_pull_server_url())
            else:
                assert False
            self.progress = 100 * i // len(self.mirror_list)

    def stop(self):
        assert not self.bStop
        self.bStop = True


# object template
class _SourceMirrorInterface:

    @property
    def capabilities(self):
        # "rsync-push-server"
        # "rsync-push"
        # "rsync-pull-server"
        # "rsync-pull"
        # "download-server"
        # "download"
        # "upload-server"
        # "upload"
        assert False

    def get_rsync_push_server_url(self):
        assert False

    def rsync_push(self, url):
        assert False

    def get_rsync_pull_server_url(self):
        assert False

    def rsync_pull(self, url):
        assert False

    def get_download_server_url(self):
        assert False

    def download(self, url):
        assert False

    def get_upload_server_url(self):
        assert False

    def upload(self, url):
        assert False
