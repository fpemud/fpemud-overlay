# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

ROM_NAME="Chip 'n Dale Rescue Rangers 2"
MAIN_ROM_FILE="Chip 'n Dale Rescue Rangers 2 (U).nes"

DESCRIPTION="Nintendo Game: ${ROM_NAME}"
HOMEPAGE="https://romhustler.org/rom/nes/chip-n-dale-rescue-rangers2"
SRC_URI="http://dl.romhustler.net/download/7NYlWRP-7pKWlody7IIv4Q/1585936283/nes/Chip%20'n%20Dale%20Rescue%20Rangers%202.7z -> ${PN}.7z"

LICENSE="unknown"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/punes"

S="${WORKDIR}"

src_install() {
	dodir ${GAMES_PREFIX_OPT}/nes-${PN}
	cp "${MAIN_ROM_FILE}" ${D}/${GAMES_PREFIX_OPT}/nes-${PN}

	dodir ${GAMES_BINDIR}
	echo "punes '${GAMES_PREFIX_OPT}/nes-${PN}/${MAIN_ROM_FILE}'" > ${D}/${GAMES_BINDIR}/nes-${PN}

	dodir /usr/share/applications
	{	echo "[Desktop Entry]"
		echo "Name=${ROM_NAME}"
		echo "Type=Application"
		echo "Comment=${DESCRIPTION}"
		echo "Exec=nes-${PN}"
		echo "TryExec=nes-${PN}"
		echo "Categories=Game;"
	} > ${D}/usr/share/applications/nes-${PN}.desktop

	prepgamesdirs
}
