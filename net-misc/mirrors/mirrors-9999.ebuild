# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

EGIT_REPO_URI="https://github.com/mirrorshq/mirrors.git"
SRC_URI=""

DESCRIPTION="--fixme"
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="zeroconf"

RDEPEND="dev-python/croniter
         dev-python/asyncio-glib
         dev-python/aiohttp
         dev-python/jinja
         dev-python/aiohttp-jinja2
         dev-python/aioftp
         dev-python/dbus-python"
DEPEND=""

src_prepare() {
	eapply_user
	if ! use zeroconf ; then
		sed -i -e "s/self.avahiSupport = .*/self.avahiSupport = False/g" "${WORKDIR}/${P}/lib/mc_param.py"
	fi
}
