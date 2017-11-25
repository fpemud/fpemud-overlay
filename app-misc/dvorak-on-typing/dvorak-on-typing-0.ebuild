# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Dvorak On Typing"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="games-emulation/dosbox"

src_unpack() {
	unzip "${DISTDIR}/${PN}.zip" -d "${WORKDIR}/gamedir"
	cp "${FILESDIR}/${PN}-dosbox.conf" "${WORKDIR}/gamedir/dosbox.conf"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "opt/${PN}"
	cp -r gamedir/* "${D}/opt/${PN}"

	dobin "${PN}"
	domenu "${FILESDIR}/${PN}.desktop"
}
