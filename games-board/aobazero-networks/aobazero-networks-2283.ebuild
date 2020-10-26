# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Latest weight for AobaZero"
HOMEPAGE="http://www.yss-aya.com/aobazero/index_e.html"

SRC_URI="http://www.yss-aya.com/aobazero/w000000002283.txt.xz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	insinto "/usr/share/${PN}"
	doins "${DISTDIR}/${A}"
}
