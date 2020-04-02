# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=3

inherit games

ROM_NAME="Metal Slug"

DESCRIPTION="MAME Game: ${ROM_NAME}"
HOMEPAGE="https://romhustler.org/rom/neogeo/metal-slug"
SRC_URI="http://dl.romhustler.net/download/GNN0BRq6UvnvRhbXlaukFA/1586408057/neogeo/mslug.zip"

LICENSE="unknown"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="games-emulation/advancemame"

S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	local NPN=mame-${PN}

	dodir ${GAMES_PREFIX_OPT}/${NPN}
	cp "${A}" ${D}/${GAMES_PREFIX_OPT}/${NPN}

	dodir ${GAMES_BINDIR}
	echo "mame '${GAMES_PREFIX_OPT}/${NPN}/$(basename ${A})'" > ${D}/${GAMES_BINDIR}/${NPN}

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
