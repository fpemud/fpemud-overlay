# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit games

DESCRIPTION="Counter Strike: Source"
HOMEPAGE="http://orange.half-life2.com/portal.html"
SRC_URI="ftp://fpemud-distfiles.local/Counter-Strike-Source.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE=""
RESTRICT="strip mirror"

DEPEND=""
RDEPEND="dev-libs/nss[abi_x86_32]
         dev-libs/nspr[abi_x86_32]
         dev-libs/libgcrypt-compat:11[abi_x86_32]
         media-libs/libpng-compat:1.2[abi_x86_32]
         media-libs/alsa-lib[abi_x86_32]
         media-libs/libsdl2[abi_x86_32]
         x11-libs/cairo[abi_x86_32]
         x11-libs/gtk+:2[abi_x86_32]
         net-print/cups[abi_x86_32]"

S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/Counter-Strike-Source"

	dodir "${GAMES_PREFIX_OPT}"
	tar -xzf "${DISTDIR}/Counter-Strike-Source.tar.gz" -C "${D}/${GAMES_PREFIX_OPT}"

	find "${D}/${dir}" -name "*.so" | xargs chmod 750
	chmod 750 "${D}/${dir}/hl2_linux"
	chmod 750 "${D}/${dir}/hl2.sh"
	chmod 750 "${D}/${dir}/css.sh"

	newicon "${D}/${GAMES_PREFIX_OPT}/Counter-Strike-Source/cstrike/resource/game.ico" "${PN}.ico"

	games_make_wrapper "${PN}" "./css.sh" "${dir}"
	make_desktop_entry "${PN}" "Counter Strike: Source" "${PN}"

	prepgamesdirs
}
