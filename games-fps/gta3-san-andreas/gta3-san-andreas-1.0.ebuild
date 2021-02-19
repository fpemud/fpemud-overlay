# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils games

DESCRIPTION="Grand Theft Auto 3 - San Andreas"
HOMEPAGE=""
SRC_URI="http://fpemud-distfiles.local/pub/Grand.Theft.Auto-San.Andreas.iso
         http://fpemud-distfiles.local/pub/${PN}
         http://fpemud-distfiles.local/pub/${PN}.desktop
         http://fpemud-distfiles.local/pub/${PN}.png
         http://fpemud-distfiles.local/pub/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

S=$WORKDIR

src_unpack() {

	mkdir "${WORKDIR}/GTA San Andreas"
	unzip "${DISTDIR}/${PN}.zip" -d "${WORKDIR}/GTA San Andreas"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${DISTDIR}/${PN}" > "${PN}"
}

src_install() {

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "GTA San Andreas" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
