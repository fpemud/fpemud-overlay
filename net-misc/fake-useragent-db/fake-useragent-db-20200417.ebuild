# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="Database file for fake-useragent"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}

src_install() {
	mkdir -p "${D}/usr/share/fake-useragent-db"
	cp ${FILESDIR}/* "${D}/usr/share/fake-useragent-db"
}
