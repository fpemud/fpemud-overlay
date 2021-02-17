# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

ROM_NAME="Super Mario Bros"
MAIN_ROM_FILE='Super Mario Bros (E).nes'

DESCRIPTION="Nintendo Game: ${ROM_NAME}"
HOMEPAGE="https://romsmania.cc/rom/nintendo/super-mario-bros-242404"
SRC_URI="mirror://romsmania/nintendo/super-mario-bros-242404/Super%20Mario%20Bros%20%28E%29.zip -> ${PN}.zip"

LICENSE="unknown"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/punes"

S="${WORKDIR}"

src_install() {
	NPN=nes-${PN}

	dodir ${GAMES_PREFIX_OPT}/${NPN}
	cp "${MAIN_ROM_FILE}" ${D}/${GAMES_PREFIX_OPT}/${NPN}

	dodir ${GAMES_BINDIR}
	echo "punes '${GAMES_PREFIX_OPT}/${NPN}/${MAIN_ROM_FILE}'" > ${D}/${GAMES_BINDIR}/${NPN}

	dodir /usr/share/applications
	{	echo "[Desktop Entry]"
		echo "Name=${ROM_NAME}"
		echo "Type=Application"
		echo "Comment=${DESCRIPTION}"
		echo "Exec=${NPN}"
		echo "TryExec=${NPN}"
		echo "Categories=Game;"
	} > ${D}/usr/share/applications/${NPN}.desktop

	prepgamesdirs
}
