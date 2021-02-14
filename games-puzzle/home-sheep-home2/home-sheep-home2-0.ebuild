# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Home Sheep Home 2 - A Little Epic"
HOMEPAGE="http://homesheephome2.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}.png
         ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

#src_unpack() {
#	7z x "${FILESDIR}/Home Sheep Home 2 A Little Epic Setup.exe" -o"${WORKDIR}"
#
#	# Restruct the directory.
#	rm -rf "${WORKDIR}/Home Sheep Home 2 A Little Epic Setup/src"
#	rm -rf "${WORKDIR}/Home Sheep Home 2 A Little Epic Setup/GDFShell.dll"
#	mkdir "${WORKDIR}/default-config"
#	mkdir "${WORKDIR}/Home Sheep Home 2"
#	mv "${WORKDIR}/Home Sheep Home 2 A Little Epic Setup/*" "${WORKDIR}/Home Sheep Home 2"
#	rmdir "${WORKDIR}/Home Sheep Home 2 A Little Epic Setup"
#}

src_unpack() {
	7z x "${DISTDIR}/${PN}.zip" -o"${WORKDIR}"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}


src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "default-config"    "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Home Sheep Home 2" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
