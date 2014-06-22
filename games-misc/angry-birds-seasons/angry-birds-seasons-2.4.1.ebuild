# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Angry Birds Seasons"
HOMEPAGE="http://www.angrybirds.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}_16x16x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_24x24x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_32x32x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_48x48x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_256x256x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE=""
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]
         media-libs/libtxc_dxtn[abi_x86_32]"

src_unpack() {
	return
}

src_prepare() {
	return
}

src_install() {
	unzip "${DISTDIR}/${PN}.zip" -d "${D}"

	dogamesbin "${DISTDIR}/${PN}"

	local res
	for res in 16 32 48 256; do
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

