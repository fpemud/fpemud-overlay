# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit eutils games check-reqs

DESCRIPTION="Need For Speed - Carbon"
HOMEPAGE="http://www.ea.com/need-for-speed-carbon"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}.png
         ftp://fpemud-workstation/distfiles-private/Need.for.Speed.Carbon.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]
         >=app-emulation/winetricks-744
         media-libs/libtxc_dxtn[abi_x86_32]"

CHECKREQS_DISK_BUILD=10G

src_unpack() {

	7z x "${DISTDIR}/Need.for.Speed.Carbon.iso" -o"${WORKDIR}/nfs10_dvd"

	# Restruct the directory.
	mkdir "${WORKDIR}/Need For Speed Carbon"

	unzip "${WORKDIR}/nfs10_dvd/0compressed.zip" -d "${WORKDIR}/Need For Speed Carbon"
	unzip "${WORKDIR}/nfs10_dvd/1compressed.zip" -d "${WORKDIR}/Need For Speed Carbon"

	cp -r "${WORKDIR}/nfs10_dvd/Support"   "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/00000000.256" "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/msvcp71.dll"  "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/msvcr71.dll"  "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/NFS_icon.ico" "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/nfsc.exe"     "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/server.cfg"   "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/server.dll"   "${WORKDIR}/Need For Speed Carbon"
	cp "${WORKDIR}/nfs10_dvd/setup.exe"    "${WORKDIR}/Need For Speed Carbon"

	rm -rf "${WORKDIR}/nfs10_dvd"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	strip-linguas ${LANGS}

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Need For Speed Carbon" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
