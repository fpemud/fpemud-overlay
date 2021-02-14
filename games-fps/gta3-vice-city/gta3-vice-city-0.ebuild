# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games

DESCRIPTION="Grand Theft Auto 3 - Vice City"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}.png
         ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {

	mkdir "${WORKDIR}/GtaViceCity"
	unzip "${DISTDIR}/${PN}.zip" -d "${WORKDIR}/GtaViceCity"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "GtaViceCity" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
