# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="StarCraft"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/Starcraft.iso
         ftp://fpemud-workstation/distfiles-private/Starcraft.Broodwar.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="broodwar"
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

S=${WORKDIR}

src_install() {
	unzip "${DISTDIR}/starcraft.zip" -d "${D}"

	dogamesbin "${FILESDIR}/starcraft"
#	doicon "${FILESDIR}/starcraft.png"
	domenu "${FILESDIR}/starcraft.desktop"

	prepgamesdirs
}
