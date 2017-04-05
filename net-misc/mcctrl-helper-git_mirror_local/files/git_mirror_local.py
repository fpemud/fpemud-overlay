#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import os
import shutil
import subprocess
from mc_util import McUtil


class HelperObject:

    _instance = None

    def __init__(self, param):
        self.param = param
        self.gitServer = None
        HelperObject._instance = self

    def getGitServer(self):
        assert self.param is not None

        if self.gitServer is None:
            self.gitServer = _GitServer(self.param)
        return self.gitServer


class Local:

    def __init__(self, subpath):
        self.gitServer = HelperObject._instance.getGitServer()
        self.gitServer.incRefCount()

        self.subpath = subpath

    def dispose(self):
        self.gitServer.decRefCount()

    @property
    def git_port(self):
        return self.gitServer.gitPort()

    @property
    def http_port(self):
        return self.gitServer.httpPort()

    @property
    def https_port(self):
        return self.gitServer.httpsPort()

    @property
    def ssh_port(self):
        return self.gitServer.sshPort()

    @property
    def data_dir(self):
        return os.path.join(self.gitServer.getDataDir(), self.subpath)

    def get_repo_list(self):
        ret = []
        for basename in McUtil.getFileList(self.data_dir, 2, "d"):
            t = basename.split("/")
            ret.append((t[0], t[1], None))
        return ret

    def has_repo(self, repo_path):
        return os.path.exists(os.path.join(self.data_dir, repo_path))

    def get_repo_url(self, repo_path, for_write=False):
        assert False

    def new_repo(self, repo_path):
        destDir = os.path.join(self.data_dir, repo_path)
        McUtil.ensureDir(destDir)
        McUtil.shell("/usr/bin/git init --bare \"%s\"" % (destDir))

    def delete_repo(self, repo_path):
        destDir = os.path.join(self.dataDir, repo_path)
        shutil.rmtree(destDir)

    def import_repo_from(self, repo_path, url):
        destDir = os.path.join(self.impl.data_dir, repo_path)
        McUtil.ensureDir(destDir)
        McUtil.shell("/usr/bin/git clone --bare \"%s\" \"%s\"" % (url, destDir))

    def pull_repo_from(self, repo_path, url):
        destDir = os.path.join(self.dataDir, repo_path)
        McUtil.shell("/usr/bin/git -C \"%s\" fetch" % (destDir))

    def push_repo_to(self, repo_path, url):
        destDir = os.path.join(self.dataDir, repo_path)
        McUtil.shell("/usr/bin/git -C \"%s\" push" % (destDir))


class _GitServer:

    def __init__(self, param):
        self.param = param
        self.tmpDir = os.path.join(self.param.tmpDir, "git-server")
        self.data_dir = os.path.join(self.param.cacheDir, "git-server")

        self.gitPort = 12531            # fixme
        self.httpPort = 12532           # fixme
        self.httpsPort = 12533          # fixme
        self.sshPort = 12534            # fixme

        self.scopeDict = dict()

        self.apacheProc = None
        self.refCount = 0

    def getDataDir(self):
        return self.data_dir

    def addUser(self, subpath, username, password, pathPattern):
        if subpath not in self.scopeDict:
            self.scopeDict[subpath] = _Scope()
        self.scopeDict[subpath].userDict[username] = (password, pathPattern)

    def addSshPubKey(self, subpath, sshPubkey, pathPattern):
        # if subpath not in self.scopeDict:
        #     self.scopeDict[subpath] = _Scope()
        # self.scopeDict[subpath].userDict[sshPubkey] = (sshPubkey, pathPattern)
        assert False

    def incRefCount(self):
        if self.refCount == 0:
            McUtil.ensureDir(self.tmpDir)
            McUtil.ensureDir(self.data_dir)
            self.apacheProc = self._runApache()
        self.refCount += 1

    def decRefCount(self):
        self.refCount -= 1
        if self.refCount == 0:
            if self.apacheProc is not None:
                self.apacheProc.terminate()
                self.apacheProc.wait()
            shutil.rmtree(self.tmpDir)

    def _runApache(self):
        cn = "mycdn-git-server"
        cfgf = os.path.join(self.tmpDir, "httpd.conf")
        pidf = os.path.join(self.tmpDir, "httpd.pid")
        errorLogFile = os.path.join(self.tmpDir, "error.log")
        accessLogFile = os.path.join(self.tmpDir, "access.log")
        certFile = os.path.join(self.tmpDir, "cert.pem")
        keyFile = os.path.join(self.tmpDir, "key.pem")
        passwdFile = os.path.join(self.tmpDir, "account.htpasswd")

        # create certificate
        caCert, caKey = McUtil.loadCertAndKey(self.param.caCertFile, self.param.caKeyFile)
        cert, k = McUtil.genCertAndKey(caCert, caKey, cn, 1024)
        McUtil.dumpCertAndKey(cert, k, certFile, keyFile)

        # create password file
        # fixme
        # with open(passwdFile, "w") as f:
        #     for uname in self.userDict:
        #         f.write(uname + "\n")           # fixme

        # create apache configuration file
        buf = ""
        buf += "LoadModule log_config_module      /usr/lib/apache2/modules/mod_log_config.so\n"
        buf += "LoadModule env_module             /usr/lib/apache2/modules/mod_env.so\n"
        buf += "LoadModule unixd_module           /usr/lib/apache2/modules/mod_unixd.so\n"
        buf += "LoadModule alias_module           /usr/lib/apache2/modules/mod_alias.so\n"
        buf += "LoadModule cgi_module             /usr/lib/apache2/modules/mod_cgi.so\n"
        buf += "LoadModule ssl_module             /usr/lib/apache2/modules/mod_ssl.so\n"
        buf += "LoadModule auth_basic_module      /usr/lib/apache2/modules/mod_auth_basic.so\n"
        buf += "LoadModule authn_core_module      /usr/lib/apache2/modules/mod_authn_core.so\n"
        buf += "LoadModule authn_file_module      /usr/lib/apache2/modules/mod_authn_file.so\n"
        buf += "LoadModule authz_core_module      /usr/lib/apache2/modules/mod_authz_core.so\n"
        buf += "LoadModule authz_user_module      /usr/lib/apache2/modules/mod_authz_user.so\n"
        buf += "\n"
        buf += "\n"
        buf += "ServerName %s\n" % (cn)
        buf += "DocumentRoot \"%s\"\n" % (self.data_dir)
        buf += "\n"
        buf += "PidFile \"%s\"\n" % (pidf)
        buf += "ErrorLog \"%s\"\n" % (errorLogFile)
        buf += "LogFormat \"%h %l %u %t \\\"%r\\\" %>s %b \\\"%{Referer}i\\\" \\\"%{User-Agent}i\\\"\" common\n"
        buf += "CustomLog \"%s\" common\n" % (accessLogFile)
        buf += "\n"
        buf += "User git\n"                                     # fixme
        buf += "Group git\n"                                    # fixme
        buf += "\n"
        buf += "Listen %d http\n" % (self.httpPort)
        buf += "Listen %d https\n" % (self.httpsPort)
        buf += "\n"
        buf += "<VirtualHost *:%d>\n" % (self.httpPort)
        buf += "\n"
        buf += "  SetEnv GIT_PROJECT_ROOT \"%s\"\n" % (self.data_dir)
        buf += "  SetEnv GIT_HTTP_EXPORT_ALL\n"
        buf += "\n"
        buf += "  AliasMatch ^/(.*/objects/[0-9a-f]{2}/[0-9a-f]{38})$          \"%s/\\$1\"\n" % (self.data_dir)
        buf += "  AliasMatch ^/(.*/objects/pack/pack-[0-9a-f]{40}.(pack|idx))$ \"%s/\\$1\"\n" % (self.data_dir)
        buf += "\n"
        buf += "  ScriptAlias / /usr/libexec/git-core/git-http-backend/\n"
        buf += "\n"
        buf += "  <Directory \"%s\">\n" % (self.data_dir)
        buf += "    AllowOverride None\n"
        buf += "  </Directory>\n"
        buf += "\n"
        buf += "</VirtualHost>\n"
        buf += "\n"
        buf += "<VirtualHost *:%d>\n" % (self.httpsPort)
        buf += "  SSLEngine on\n"
        buf += "  SSLProtocol all\n"
        buf += "  SSLCertificateFile \"%s\"\n" % (certFile)
        buf += "  SSLCertificateKeyFile \"%s\"\n" % (keyFile)
        buf += "\n"
        buf += "  SetEnv GIT_PROJECT_ROOT \"%s\"\n" % (self.data_dir)
        buf += "  SetEnv GIT_HTTP_EXPORT_ALL\n"
        buf += "\n"
        buf += "  AliasMatch ^/(.*/objects/[0-9a-f]{2}/[0-9a-f]{38})$          \"%s/\$1\"\n" % (self.data_dir)
        buf += "  AliasMatch ^/(.*/objects/pack/pack-[0-9a-f]{40}.(pack|idx))$ \"%s/\$1\"\n" % (self.data_dir)
        buf += "\n"
        buf += "  ScriptAlias / /usr/libexec/git-core/git-http-backend/\n"
        buf += "\n"
        buf += "  <Directory \"%s\">\n" % (self.data_dir)
        buf += "    AllowOverride None\n"
        buf += "  </Directory>\n"
        buf += "\n"
        buf += "  <If \"%{REQUEST_METHOD} == 'GET' && %{QUERY_STRING} =~ /service=git-receive-pack/\">\n"
        buf += "    AuthType Basic\n"
        buf += "    AuthName \"Git Repositories\"\n"
        buf += "    AuthBasicProvider file\n"
        buf += "    AuthUserFile \"%s\"\n" % (passwdFile)
        buf += "    Require valid-user\n"
        buf += "  </If>\n"
        buf += "\n"
        buf += "  <LocationMatch \"^/.*/git-receive-pack$\">\n"
        buf += "    AuthType Basic\n"
        buf += "userDict    AuthName \"Git Repositories\"\n"
        buf += "    AuthBasicProvider file\n"
        buf += "    AuthUserFile \"%s\"\n" % (passwdFile)
        buf += "    Require valid-user\n"
        buf += "  </LocationMatch>\n"
        buf += "\n"
        buf += "</VirtualHost>\n"
        with open(cfgf, "w") as f:
            f.write(buf)

        # run apache process
        cmd = "/usr/sbin/apache2 -d \"%s\" -f \"%s\" -DFOREGROUND" % (self.data_dir, cfgf)
        proc = subprocess.Popen(cmd, shell=True, universal_newlines=True)

        return proc


class _Scope:

    def __init__(self):
        self.userDict = dict()
        self.sshPubKeyDict = dict()
