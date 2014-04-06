# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="DOS game CISCO HEAT"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}-dosbox.conf
         ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND="app-arch/unzip"
RDEPEND="games-emulation/dosbox"

src_unpack() {
	mkdir "${WORKDIR}/gamedir"
	unzip "${DISTDIR}/${PN}.zip" -d "${WORKDIR}/gamedir"
	cp "${DISTDIR}/${PN}-dosbox.conf" "${WORKDIR}/gamedir/dosbox.conf"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r gamedir/* "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
