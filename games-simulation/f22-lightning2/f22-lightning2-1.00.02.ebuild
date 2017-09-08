# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="F-22 Lightning 2"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}-dosbox.conf
         ftp://fpemud-workstation/distfiles-private/F-22.Lightning.2.zip
         ftp://fpemud-workstation/distfiles-private/${PN}-setup.cfg-dosbox.patch"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="games-emulation/dosbox"

src_unpack() {

	unzip "${DISTDIR}/F-22.Lightning.2.zip" -d "${WORKDIR}/gamedir"
	cp "${DISTDIR}/${PN}-dosbox.conf" "${WORKDIR}/gamedir/dosbox.conf"
	patch "${WORKDIR}/gamedir/SETUP.CFG" "${DISTDIR}/${PN}-setup.cfg-dosbox.patch"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r gamedir/* "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
