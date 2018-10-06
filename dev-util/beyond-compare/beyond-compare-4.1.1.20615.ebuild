# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit unpacker

DESCRIPTION="A graphical diff and merge tool"
HOMEPAGE="http://www.scootersoftware.com"

MY_PN="bcompare"
MY_P="${MY_PN}-${PV}"
SRC_URI="x86? ( http://www.scootersoftware.com/${MY_P}_i386.deb )
	amd64? ( http://www.scootersoftware.com/${MY_P}_amd64.deb )"
# Very bad to use RESTRICT=binchecks here, but we need to prevent scanelf from
# modifying the binaries
RESTRICT="binchecks mirror"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-qt/qtgui:4
	dev-qt/qtcore:4
	dev-qt/qtwebkit:4
	dev-qt/qtopengl:4
	app-arch/bzip2
	app-text/poppler[utils]"

S="${WORKDIR}"

src_unpack() {
	unpack_deb "${A}"
}

src_install() {
	cp -r --preserve=mode,links * "${ED}" || die
}
