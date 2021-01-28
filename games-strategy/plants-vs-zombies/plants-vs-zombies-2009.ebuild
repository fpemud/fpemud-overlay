# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Plants vs Zombies the game"
HOMEPAGE=""
SRC_URI="http://fpemud-distfiles.local/pub/${P}.zip"
LICENSE="unknown"
SLOT="2009"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

src_prepare() {
	return
}

src_unpack() {
	return
}

src_install() {
	unzip -q "${DISTDIR}/${P}.zip" -d "${D}"

	dogamesbin "${FILESDIR}/${P}"
	doicon "${FILESDIR}/${P}.png"
	domenu "${FILESDIR}/${P}.desktop"

	prepgamesdirs
}
