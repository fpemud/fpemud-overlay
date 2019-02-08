# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Gentoo bashrc script"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_install() {
	dodir "/etc/portage"
	mkdir "${D}/etc/portage/bashrc.d"
	touch "${D}/etc/portage/bashrc.d/.keep"
	cp "${FILESDIR}/bashrc" "${D}/etc/portage"
}
