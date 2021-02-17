# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION="StarCraft with BroodWar"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/Starcraft.iso
         ftp://fpemud-workstation/distfiles-private/Starcraft.Broodwar.iso
         ftp://fpemud-workstation/distfiles-private/startcraft-1.08-extra.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip
        app-arch/mpq-tools"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {
	mkdir "${WORKDIR}/Starcraft"

	# starcraft
	7z x "${DISTDIR}/Starcraft.iso" -o"${WORKDIR}/cd"

	mkdir "${WORKDIR}/mpq"
	cd "${WORKDIR}/mpq"
	mpq-extract -e "${WORKDIR}/cd/INSTALL.EXE"
	cd "${WORKDIR}"

	"${FILESDIR}/newfiles.py" "${FILESDIR}/filelist.starcraft" "${WORKDIR}/mpq" "${WORKDIR}/Starcraft"

	rm -rf "${WORKDIR}/mpq"
	rm -rf "${WORKDIR}/cd"

	# broodwar
	rm -rf "${WORKDIR}/Starcraft/maps/ladder"
	rm -f "${WORKDIR}/Starcraft/maps/(8)Green Valleys.scm"

	7z x "${DISTDIR}/Starcraft.Broodwar.iso" -o"${WORKDIR}/cd"

	mkdir "${WORKDIR}/mpq"
	cd "${WORKDIR}/mpq"
	mpq-extract -e "${WORKDIR}/cd/INSTALL.EXE"
	cd "${WORKDIR}"

	"${FILESDIR}/newfiles.py" "${FILESDIR}/filelist.broodwar" "${WORKDIR}/mpq" "${WORKDIR}/Starcraft"

	rm -rf "${WORKDIR}/mpq"

	mkdir "${WORKDIR}/mpq"
	cd "${WORKDIR}/mpq"
	mpq-extract -e "${WORKDIR}/cd/PATCH/BW_108B.EXE"
	cd "${WORKDIR}"

	"${FILESDIR}/newfiles.py" "${FILESDIR}/filelist.patch-1.08" "${WORKDIR}/mpq" "${WORKDIR}/Starcraft"

	rm -rf "${WORKDIR}/mpq"

	rm -rf "${WORKDIR}/cd"

	7z x -y "${DISTDIR}/startcraft-1.08-extra.zip" -o"${WORKDIR}/Starcraft"
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
