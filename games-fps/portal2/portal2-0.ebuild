# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

DESCRIPTION="Portal 2"
HOMEPAGE="http://www.valvesoftware.com/games/portal2.html"
SRC_URI="Portal2.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE=""
RESTRICT="strip fetch"

DEPEND=""
RDEPEND="sys-apps/util-linux[abi_x86_32]
         dev-libs/nss[abi_x86_32]
         dev-libs/nspr[abi_x86_32]
         dev-libs/libgcrypt:11[abi_x86_32]
         media-libs/libsdl2[abi_x86_32]
         x11-libs/cairo[abi_x86_32]
         x11-libs/gtk+:2[abi_x86_32]
         net-print/cups[abi_x86_32]
         media-libs/libpng:1.2[abi_x86_32]
         media-libs/libtxc_dxtn[abi_x86_32]"

S="${WORKDIR}"

src_unpack() {
	return
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/Portal2/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/Portal2/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}"
	tar -xzf "${DISTDIR}/Portal2.tar.gz" -C "${D}/${GAMES_PREFIX_OPT}"
        rm "${D}/${GAMES_PREFIX_OPT}/Portal2/bin/libstdc++.so.6"               # bug: https://github.com/ValveSoftware/steam-for-linux/issues/3273

	dogamesbin "${PN}"
	doicon "${D}/${GAMES_PREFIX_OPT}/Portal2/portal2.png"
	make_desktop_entry "${PN}" "Portal 2" "${PN}"

	prepgamesdirs
}

