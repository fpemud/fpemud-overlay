# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Call of Duty"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}.zip
         ftp://fpemud-workstation/distfiles-private/CoD_1.5_Patch.exe"
LICENSE=""
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
	mkdir -p "${D}/opt/${PN}/CallofDuty"
	unzip "${DISTDIR}/${PN}.zip" -d "${D}/opt/${PN}/CallofDuty"

	dogamesbin "${FILESDIR}/${PN}"

	local res
	for res in 16 32; do
		newicon -s ${res} "${FILESDIR}/${PN}_${res}x${res}x8.png" "${PN}.png"
	done

	domenu "${FILESDIR}/${PN}.desktop"

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
