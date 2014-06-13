# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Braid"
HOMEPAGE="http://braid-game.com"
SRC_URI="Braid.linux"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="fetch strip"

DEPEND="app-arch/p7zip"
RDEPEND=""

src_unpack() {
	7z x "${DISTDIR}/Braid.linux" -o"${WORKDIR}"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r data/gamedata/* "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r data/${ARCH}/* "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "data/gamedata/braid.png"
	domenu "${FILESDIR}/${PN}.desktop"
	prepgamesdirs
}
