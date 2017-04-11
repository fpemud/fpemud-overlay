# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION="Beholder"
HOMEPAGE="http://www.neighbours-from-hell.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]"

S=${WORKDIR}

src_unpack() {
	return
}

src_prepare() {
	return
}

src_install() {
	dodir "/opt/${PN}"
	unzip -q "${DISTDIR}/${PN}.zip" -d "${D}/opt/${PN}"

	dogamesbin "${FILESDIR}/${PN}"
	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
