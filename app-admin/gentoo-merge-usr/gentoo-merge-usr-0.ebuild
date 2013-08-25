# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="Remove wheel group"

LICENSE=""
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND=""
RDEPEND="app-admin/gentoo-bashrc"

src_prepare() {
	return
}

src_install() {
	exeinto /usr/libexec
	doexe "${FILESDIR}/gentoo-merge-usr"

	dodir "/etc/portage/bashrc.d"
	cp -r "${FILESDIR}/bashrc.d/merge-usr" "${D}/etc/portage/bashrc.d"
}

pkg_postinst() {
	elog "Run /usr/libexec/gentoo-merge-usr manually to do /usr merge"
	elog "for your system. This script will be run after every emerge"
	elog "to maintain the system status."
}
