# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games check-reqs

DESCRIPTION="Need For Speed - Carbon"
HOMEPAGE="http://www.ea.com/need-for-speed-carbon"
SRC_URI="http://fpemud-distfiles.local/pub/Need.for.Speed.Carbon.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]
         >=app-emulation/winetricks-744"

CHECKREQS_DISK_BUILD=10G

S="${WORKDIR}"

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
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	strip-linguas ${LANGS}

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Need For Speed Carbon" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}

pkg_cruft_filter() {
	echo "~/.config/need-for-speed10/***"
	echo "~/.local/share/need-for-speed10/***"
}
