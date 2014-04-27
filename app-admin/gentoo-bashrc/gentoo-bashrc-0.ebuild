# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="Gentoo bashrc script"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	return
}

src_install() {
	dodir "/etc/portage"
	mkdir "${D}/etc/portage/bashrc.d"
	cp "${FILESDIR}/bashrc" "${D}/etc/portage"
}
