# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games check-reqs

DESCRIPTION="Need For Speed 8 - Underground 2"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}.png
         ftp://fpemud-workstation/distfiles-private/Need.for.Speed.Underground.2.CD1.iso
         ftp://fpemud-workstation/distfiles-private/Need.for.Speed.Underground.2.CD2.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]"

CHECKREQS_DISK_BUILD=2G

src_unpack() {

	7z x "${DISTDIR}/Need.for.Speed.Underground.2.CD1.iso" -o"${WORKDIR}/nfs8_cd1"
	7z x "${DISTDIR}/Need.for.Speed.Underground.2.CD2.iso" -o"${WORKDIR}/nfs8_cd2"

	# Restruct the directory.
	mkdir "${WORKDIR}/Need for Speed Underground 2"

	unzip "${WORKDIR}/nfs8_cd1/compressed.zip" -d "${WORKDIR}/Need for Speed Underground 2"
	unzip "${WORKDIR}/nfs8_cd2/compressed.zip" -d "${WORKDIR}/Need for Speed Underground 2"

	mv "${WORKDIR}/nfs8_cd1/Support"       "${WORKDIR}/Need for Speed Underground 2"
	mv "${WORKDIR}/nfs8_cd2/MOVIES"        "${WORKDIR}/Need for Speed Underground 2"
	mv "${WORKDIR}/nfs8_cd2/SDATA"         "${WORKDIR}/Need for Speed Underground 2"
	mv "${WORKDIR}/nfs8_cd2/00000000.016"  "${WORKDIR}/Need for Speed Underground 2"
	mv "${WORKDIR}/nfs8_cd2/00000000.256"  "${WORKDIR}/Need for Speed Underground 2"
	mv "${WORKDIR}/nfs8_cd2/NFSU_icon.ico" "${WORKDIR}/Need for Speed Underground 2"
	mv "${WORKDIR}/nfs8_cd2/speed2.exe"    "${WORKDIR}/Need For Speed Underground 2"

	rm -rf "${WORKDIR}/nfs8_cd1"
	rm -rf "${WORKDIR}/nfs8_cd2"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Need for Speed Underground 2" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
