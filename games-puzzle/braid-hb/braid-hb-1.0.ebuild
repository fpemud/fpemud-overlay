# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

DESCRIPTION="Platform game where you manipulate flow of time"
HOMEPAGE="http://braid-game.com"
SRC_URI="mirror://fpemud-distfiles-private/Braid.linux"
ZIP_OFFSET="191620"

LICENSE="Arphic CCPL-Attribution-ShareAlike-NonCommercial-1.0 MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE=""
RESTRICT="strip"

DEPEND="app-arch/unzip"
RDEPEND="x11-libs/libXinerama[abi_x86_32]"
#RDEPEND="media-libs/libsdl[sound,joystick,video]
#         x11-libs/libX11
#         x11-libs/libXau
#         x11-libs/libxcb
#         x11-libs/libXdmcp
#         x11-libs/libXext
#         virtual/opengl"

S=${WORKDIR}/data

pkg_nofetch() {
	echo
	elog "Download ${SRC_URI} from ${HOMEPAGE} and place it in ${DISTDIR}"
	echo
}

src_unpack() {
	# remove the exe stuff
	tail --bytes=+$(( ${ZIP_OFFSET} + 1 )) "${DISTDIR}/${A}" > "${MY_P}.zip"
	unzip -q "${MY_P}.zip" || die "unpacking failed"
	rm -f "${MY_P}.zip"
}

src_install() {
	local dir="${GAMES_PREFIX_OPT}/Braid"

	insinto "${dir}"
	exeinto "${dir}"

	doins -r gamedata/* || die "doins failed"
	doexe ${ARCH}/* || die "doexe failed"

	doicon "gamedata/braid.png" || die "doicon failed"

	games_make_wrapper "${PN}" "./${PN}" "${dir}"
	make_desktop_entry "${PN}" "Braid" "${PN}"

	prepgamesdirs
}
