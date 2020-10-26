# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION=""
HOMEPAGE="http://shogigui.siganus.com"
SRC_URI="http://shogigui.siganus.com/shogigui/${PN}v${PV}.zip"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""

DEPEND="app-arch/unzip"
RDEPEND=""

S="${WORKDIR}/${PN}v${PV}"

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r * "${D}/${GAMES_PREFIX_OPT}/${PN}"

#	dogamesbin "${PN}"
#	doicon "${DISTDIR}/${PN}.png"
#	domenu "${FILESDIR}/${PN}.desktop"
	prepgamesdirs
}

