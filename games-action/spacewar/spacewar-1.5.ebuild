# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION="DOS game SPACEWAR"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/SPACEWAR.EXE"
LICENSE=""
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="games-emulation/dosbox"

src_prepare() {
	return
}

src_unpack() {
	return
}

src_install() {
	dodir "/opt/${PN}"
	cp "${DISTDIR}/SPACEWAR.EXE" "${D}/opt/${PN}"
	cp "${FILESDIR}/${PN}-dosbox.conf"  "${D}/opt/${PN}/dosbox.conf"

	dogamesbin "${FILESDIR}/${PN}"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
