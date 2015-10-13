# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

KEYWORDS="-* amd64 x86"
DESCRIPTION="X11 fallback session"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="x11-apps/xsm"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	return
}

src_install() {
	dodir "/etc/env.d"
	cp "${FILESDIR}/90xsession" "${D}/etc/env.d"
}
