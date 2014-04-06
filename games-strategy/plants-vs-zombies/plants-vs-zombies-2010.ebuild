# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Plants vs Zombies the game"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${P}
         ftp://fpemud-workstation/distfiles-private/${P}.desktop
         ftp://fpemud-workstation/distfiles-private/${P}.png
         ftp://fpemud-workstation/distfiles-private/${P}.zip"
LICENSE="unknown"
SLOT="2010"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]"

src_prepare() {
	return
}

src_unpack() {
	return
}

src_install() {
	unzip -q "${DISTDIR}/${P}.zip" -d "${D}"

	dogamesbin "${DISTDIR}/${P}"
	doicon "${DISTDIR}/${P}.png"
	domenu "${DISTDIR}/${P}.desktop"

	prepgamesdirs
}
