# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils gnome2-utils games

DESCRIPTION="Angry Birds"
HOMEPAGE="http://www.angrybirds.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}.zip
         ftp://fpemud-workstation/distfiles-private/${PN}-default-config-user.zip"
LICENSE=""
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {
	return
}

src_prepare() {
	return
}

src_install() {
	unzip "${DISTDIR}/${PN}.zip" -d "${D}"
	unzip "${DISTDIR}/${PN}-default-config-user.zip" -d "${D}"

	dogamesbin "${FILESDIR}/${PN}"

	local res
	for res in 16 32 48 256; do
		newicon -s ${res} "${FILESDIR}/${PN}_${res}x${res}x32.png" "${PN}.png"
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

pkg_cruft_filter() {
	echo "~/.local/share/angry-birds/***"
}
