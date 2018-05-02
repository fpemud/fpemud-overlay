# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="StarCraft"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/Starcraft.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip
        app-arch/mpq-tools"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {
	7z x "${DISTDIR}/Starcraft.iso" -o"${WORKDIR}/cd"

	mkdir "${WORKDIR}/mpq"
	cd "${WORKDIR}/mpq"
	mpq-extract -e "${WORKDIR}/cd/INSTALL.EXE"

	mkdir "${WORKDIR}/Starcraft"
	"${FILESDIR}/newfiles.py" "${FILESDIR}/starcraft.filelist" "${WORKDIR}/mpq" "${WORKDIR}/Starcraft"

	rm -rf "${WORKDIR}/mpq"
	rm -rf "${WORKDIR}/cd"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Starcraft" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
#	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
