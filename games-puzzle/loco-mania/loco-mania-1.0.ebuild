# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Loco-mania is a simulation of a train dispatcher"
HOMEPAGE="http://www.loco-mania.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/Loco.Mania.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/uharc"
RDEPEND="virtual/wine[abi_x86_32]
         x11-apps/xrandr"

src_unpack() {
	unzip "${DISTDIR}/Loco.Mania.zip" -d "${WORKDIR}"

	cd "${WORKDIR}/Loco Mania"
	uharc x -y+ TNT.UHA
	rm -f TNT*
	rm -f SETUP.BAT
}

src_prepare() {
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Loco Mania" "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r "${FILESDIR}/cfg2settings" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
#	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
