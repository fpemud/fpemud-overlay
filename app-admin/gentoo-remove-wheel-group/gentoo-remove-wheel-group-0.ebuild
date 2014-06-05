# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="Remove wheel group"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="app-admin/gentoo-bashrc"

src_prepare() {
	return
}

src_install() {
	dodir "/etc/portage/bashrc.d"
	cp -r "${FILESDIR}/bashrc.d"/* "${D}/etc/portage/bashrc.d"
}
