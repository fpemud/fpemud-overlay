# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit games

ROM_NAME="Super Contra 3"
MAIN_ROM_FILE='Super Contra 3 (Unl) [p1].nes'

DESCRIPTION="Nintendo Game: ${ROM_NAME}"
HOMEPAGE="https://romhustler.org/rom/nes/super-contra3"
SRC_URI="http://dl.romhustler.net/download/bkohlhv_dJ7q8jiPhr6keQ/1585933458/nes/Super%20Contra%203.7z -> ${PN}.7z"

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
