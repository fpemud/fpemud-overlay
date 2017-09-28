# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Beach Head 2002"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}_32x32x8.png
         ftp://fpemud-workstation/distfiles-private/${PN}.zip
         ftp://fpemud-workstation/distfiles-private/${PN}-default-config.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

src_prepare() {
        return
}

src_unpack() {
	return
}

src_install() {
	unzip "${DISTDIR}/${PN}.zip" -d "${D}"
	unzip "${DISTDIR}/${PN}-default-config.zip" -d "${D}"

	dogamesbin "${DISTDIR}/${PN}"

        local res
        for res in 32; do
                newicon -s ${res} "${DISTDIR}/${PN}_${res}x${res}x8.png" "${PN}.png"
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
