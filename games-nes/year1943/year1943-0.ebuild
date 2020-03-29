# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit games

ROM_NAME="1943 - The Battle of Midway"
MAIN_ROM_FILE='1943 - The Battle of Midway (U).nes'

DESCRIPTION="Nintendo Game: ${ROM_NAME}"
HOMEPAGE="https://romhustler.org/rom/nes/1943-the-battle-of-midway"
SRC_URI="http://dl.romhustler.net/download/Nd4yVHRty0UwtE0xP6zjKg/1585936673/nes/1943%20-%20The%20Battle%20of%20Midway.7z -> ${PN}.7z"

LICENSE="unknown"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/punes"

S="${WORKDIR}"

src_install() {
	GN="1943"

	dodir ${GAMES_PREFIX_OPT}/nes-${GN}
	cp "${MAIN_ROM_FILE}" ${D}/${GAMES_PREFIX_OPT}/nes-${GN}

	dodir ${GAMES_BINDIR}
	echo "punes '${GAMES_PREFIX_OPT}/nes-${GN}/${MAIN_ROM_FILE}'" > ${D}/${GAMES_BINDIR}/nes-${GN}

	dodir /usr/share/applications
	{	echo "[Desktop Entry]"
		echo "Name=${ROM_NAME}"
		echo "Type=Application"
		echo "Comment=${DESCRIPTION}"
		echo "Exec=nes-${GN}"
		echo "TryExec=nes-${GN}"
		echo "Categories=Game;"
	} > ${D}/usr/share/applications/nes-${GN}.desktop

	prepgamesdirs
}
