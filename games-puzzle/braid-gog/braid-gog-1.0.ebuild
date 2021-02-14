# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit games

MY_PN="braid"
DESCRIPTION="Platform game where you manipulate flow of time"
HOMEPAGE="http://braid-game.com"
SRC_URI="mirror://linuxgame/Braid_i386.appimage"

LICENSE="Arphic CCPL-Attribution-ShareAlike-NonCommercial-1.0 MIT"
SLOT="0"
KEYWORDS="-* ~amd64 ~x86"

IUSE="+system-libs"
RESTRICT="strip"

DEPEND="app-arch/unzip"
RDEPEND="
	system-libs? (
		media-libs/libsdl2[sound,joystick,video]
		x11-libs/libXft[abi_x86_32]
		x11-libs/fltk[abi_x86_32]
                media-gfx/nvidia-cg-toolkit[abi_x86_32]
	)
	x11-libs/libXinerama[abi_x86_32]
	!games-puzzle/braid-hb
"

S=${WORKDIR}/squashfs-root

pkg_nofetch() {
	echo
	elog "Download ${SRC_URI} from ${HOMEPAGE} and place it in ${DISTDIR}"
	echo
}

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}"
	chmod +x "${WORKDIR}/${A}"
        "${WORKDIR}/${A}" --appimage-extract
	use system-libs && rm -rf ${S}/usr/bin/game/lib/*
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/Braid"
	cp -r usr/bin/* "${D}/${GAMES_PREFIX_OPT}/Braid"

	# braid can only find library directly in /usr/lib
	use system-libs && ln -sf "/usr/lib/fltk/libfltk.so.1.3" "${D}/${GAMES_PREFIX_OPT}/Braid/game/lib"

	doicon "Braid.png"
	make_desktop_entry "${MY_PN}" "Braid" "Braid"
	games_make_wrapper "${MY_PN}" "./game/Braid.bin.x86" "${GAMES_PREFIX_OPT}/Braid"
	prepgamesdirs
}

pkg_extra_files() {
	echo "~/.Braid/***"
}
