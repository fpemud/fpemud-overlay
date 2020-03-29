# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit games

ROM_NAME="1942"
MAIN_ROM_FILE='1942 (JU) [!].nes'

DESCRIPTION="Nintendo Game: ${ROM_NAME}"
HOMEPAGE="https://romhustler.org/rom/nes/1942"
SRC_URI="http://dl.romhustler.net/download/b0s9zYQoKixS46mc7y2lAQ/1585934895/nes/1942.7z"

LICENSE="unknown"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/punes"

S="${WORKDIR}"

src_install() {
	GN="1942"

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
