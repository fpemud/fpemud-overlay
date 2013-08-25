# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="fpemud patches"

LICENSE=""
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	return
}

src_install() {
	dodir "/etc/portage"
	cp -r "${FILESDIR}/patches" "${D}/etc/portage"
}
