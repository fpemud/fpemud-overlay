# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Braid"
HOMEPAGE="http://braid-game.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}_16x16x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_32x32x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_48x48x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_128x128x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_256x256x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]
         >=app-emulation/winetricks-744"

src_unpack() {
	unzip "${DISTDIR}/${PN}.zip" -d "${WORKDIR}"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}


src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Braid EN" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"

	local res
	for res in 16 32 48 128 256; do
		newicon -s ${res} "${DISTDIR}/${PN}_${res}x${res}x32.png" "${PN}.png"
	done

	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
