# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/fpemud/pservers.git"
SRC_URI=""

DESCRIPTION="--fixme"
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="acct-user/pservers
         acct-group/pservers
         dev-python/dbus-python
         dev-python/python-prctl
         dev-python/psutil
         www-servers/apache[apache2_modules_proxy,apache2_modules_proxy_http]"
DEPEND=""


# install pservers program by make
# install pservers python module by distutils

src_compile() {
        emake || die "emake failed"
        distutils-r1_src_compile
}

src_install() {
        emake DESTDIR="${D}" install
        distutils-r1_src_install
}
