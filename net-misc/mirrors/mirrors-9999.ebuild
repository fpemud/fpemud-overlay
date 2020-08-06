# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/mirrorshq/mirrors.git"
SRC_URI=""

DESCRIPTION="--fixme"
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="zeroconf"

RDEPEND="acct-user/mirrors
         acct-group/mirrors
         dev-python/croniter
         dev-python/asyncio-glib
         dev-python/aiohttp
         dev-python/jinja
         dev-python/aiohttp-jinja2
         dev-python/dbus-python"
RDEPEND="${RDEPEND}
         dev-python/pyftpdlib
         www-servers/apache"
DEPEND=""


# install mirrors program by make
# install mirrors python module by distutils

src_prepare() {
	eapply_user
	if ! use zeroconf ; then
		sed -i -e "s/self.avahiSupport = .*/self.avahiSupport = False/g" "${WORKDIR}/${P}/lib/mc_param.py"
	fi
	distutils-r1_src_prepare
}

src_compile() {
	emake || die "emake failed"
	distutils-r1_src_compile
}

src_install() {
	emake DESTDIR="${D}" install
	distutils-r1_src_install
}
