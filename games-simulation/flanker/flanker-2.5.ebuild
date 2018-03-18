# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION="XXX"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/flanker2.5.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unshield
        app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

S=${WORKDIR}

src_unpack() {
	curdir=`pwd`

	# extract
	7z x "${DISTDIR}/flanker2.5.iso" -o"${WORKDIR}/iso"
	unshield -d "${WORKDIR}/data" x "${WORKDIR}/iso/data" > /dev/null			# unshield has no quiet option, sucks

	# Restruct the directory.
	mv "${WORKDIR}/data/flanker" "${WORKDIR}/Flanker 2.5"

	cd "${WORKDIR}/Flanker 2.5/Joystick/SAITEK"
	for file in *_* ; do mv "$file" "${file//_/ }" ; done
	cd "${WORKDIR}/Flanker 2.5/Missions"
	for file in *_* ; do mv "$file" "${file//_/ }" ; done
	cd "${WORKDIR}/Flanker 2.5/Missions/Head To Head"
	for file in *_* ; do mv "$file" "${file//_/ }" ; done
	cd "${WORKDIR}/Flanker 2.5/SOUNDS/tracks"
	for file in *_* ; do mv "$file" "${file//_/ }" ; done

	mv "${WORKDIR}/data/pci_high"/* "${WORKDIR}/Flanker 2.5"

	cp -r "${WORKDIR}/data/tex_high"/* "${WORKDIR}/data/tex_med"/* "${WORKDIR}/data/tex_low"/* "${WORKDIR}/Flanker 2.5/Bazar/Terrain"

	mkdir -p "${WORKDIR}/Flanker 2.5/World/Shapes"

	mv "${WORKDIR}/iso/Readme.doc"                   "${WORKDIR}/Flanker 2.5"
	mv "${WORKDIR}/iso/Flanker 2.0 Pilots Card.pdf"  "${WORKDIR}/Flanker 2.5"
	mv "${WORKDIR}/iso/Flanker 2.0 manual final.pdf" "${WORKDIR}/Flanker 2.5"

	# delete
	rm -rf "${WORKDIR}/iso"
	rm -rf "${WORKDIR}/data"

	cd "$curdir"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Flanker 2.5" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
