#!/usr/bin/python3
# -*- coding: utf-8; tab-width: 4; indent-tabs-mode: t -*-

import os
import subprocess
from mc_util import McUtil


class HelperObject:

    _instance = None

    def __init__(self, param):
        self.param = param
        self.fileServer = None
        HelperObject._instance = self

    def getFileServer(self):
        assert self.param is not None

        if self.fileServer is None:
            self.fileServer = _FileServer(self.param)
        return self.fileServer


class Local:

    def __init__(self, subpath):
        self.fileServer = HelperObject._instance.getFileServer()
        self.fileServer.incRefCount()

        self.subpath = subpath

    def dispose(self):
        self.fileServer.decRefCount()

    @property
    def data_dir(self):
        return os.path.join(self.fileServer.getDataDir(), self.subpath)

    def rsync_pull(self, url):
        McUtil.shell("/usr/bin/rsync -a -z -hhh --delete --info=progress2 %s %s" % (url, self.data_dir))

    def download(self, url):
        McUtil.shell("/bin/wget -m --directory-prefix=%s %s" % (self.data_dir, url))


class _FileServer:

    def __init__(self, param):
        self.param = param
        self.tmpDir = os.path.join(self.param.tmpDir, "file-server")
        self.data_dir = os.path.join(self.param.cacheDir, "file-server")

        self.httpPort = 12631            # fixme
        self.httpsPort = 12632           # fixme
        self.ftpPort = 12633             # fixme
        self.ftpsPort = 12634            # fixme
        self.rsyncPort = 12635           # fixme

        self.scopeDict = dict()

        self.apacheProc = None
        self.ftpProc = None
        self.rsyncProc = None
        self.refCount = 0

    def incRefCount(self):
        # if self.refCount == 0:
        #     McUtil.ensureDir(self.tmpDir)
        #     McUtil.ensureDir(self.data_dir)
        #     self.apacheProc = self._runApache()
        self.refCount += 1

    def decRefCount(self):
        self.refCount -= 1
        # if self.refCount == 0:
        #     if self.apacheProc is not None:
        #         self.apacheProc.terminate()
        #         self.apacheProc.wait()
        #     shutil.rmtree(self.tmpDir)

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
        with open(passwdFile, "w") as f:
            for uname in self.userDict:
                f.write(uname + "\n")           # fixme

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
