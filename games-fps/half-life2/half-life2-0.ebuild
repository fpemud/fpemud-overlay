# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit games

DESCRIPTION="Half-life2"
HOMEPAGE="http://orange.half-life2.com/portal.html"
SRC_URI="mirror://fpemud-distfiles-private/HL2.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE=""
RESTRICT="strip fetch"

#         dev-libs/libgcrypt:11[abi_x86_32]

DEPEND=""
RDEPEND="dev-libs/nss[abi_x86_32]
         dev-libs/nspr[abi_x86_32]
         media-libs/alsa-lib[abi_x86_32]
         dev-libs/libgcrypt[abi_x86_32]
         media-libs/libsdl2[abi_x86_32]
         x11-libs/cairo[abi_x86_32]
         x11-libs/gtk+:2[abi_x86_32]
         net-print/cups[abi_x86_32]
         media-libs/libpng:1.2[abi_x86_32]
         media-fonts/font-ibm-type1"

S="${WORKDIR}"

src_unpack() {
	return
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/HL2/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/HL2/g" "${FILESDIR}/launcher.sh" > "${WORKDIR}/launcher.sh"

	sed -e "s/^EXEC=.*$/EXEC=hl1.sh/g" "${WORKDIR}/launcher.sh" > "${WORKDIR}/half-life"
	sed -e "s/^EXEC=.*$/EXEC=hl2.sh/g" "${WORKDIR}/launcher.sh" > "${WORKDIR}/half-life2"
	sed -e "s/^EXEC=.*$/EXEC=episodic.sh/g" "${WORKDIR}/launcher.sh" > "${WORKDIR}/half-life2-episode1"
	sed -e "s/^EXEC=.*$/EXEC=ep2.sh/g" "${WORKDIR}/launcher.sh" > "${WORKDIR}/half-life2-episode2"
	sed -e "s/^EXEC=.*$/EXEC=lostcoast.sh/g" "${WORKDIR}/launcher.sh" > "${WORKDIR}/half-life2-lostcoast"
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/HL2"

	dodir "${GAMES_PREFIX_OPT}"
	tar -xzf "${DISTDIR}/HL2.tar.gz" -C "${D}/${GAMES_PREFIX_OPT}"
	find "${D}/${GAMES_PREFIX_OPT}" -name "*.cache" | xargs rm -f

	dogamesbin "half-life"
	make_desktop_entry "half-life" "Half-Life" "half-life"

	dogamesbin "half-life2"
	make_desktop_entry "half-life2" "Half-Life2" "half-life2"

	dogamesbin "half-life2-episode1"
	make_desktop_entry "half-life2-episode1" "Half-Life2: Episode 1" "half-life2-episode1"

	dogamesbin "half-life2-episode2"
	make_desktop_entry "half-life2-episode2" "Half-Life2: Episode 2" "half-life2-episode2"

	dogamesbin "half-life2-lostcoast"
	# don't add menu entry for test episode

	prepgamesdirs
}
