# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/mycdn-controller
         dev-vcs/git
		 www-servers/apache"
DEPEND=""

S=${WORKDIR}

src_install() {
	dodir /usr/lib/mycdn-controller/helpers
	cp "${FILESDIR}"/* "${D}/usr/lib/mycdn-controller/helpers"
}
