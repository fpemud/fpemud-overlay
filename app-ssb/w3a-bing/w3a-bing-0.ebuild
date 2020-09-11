# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit desktop

SRC_URI=""
KEYWORDS="*"
DESCRIPTION="Using website \"bing.com\" as an application"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="www-client/epiphany"
DEPEND="${RDEPEND}"

S="${WORKDIR}"

src_install() {
	dobin "${FILESDIR}/${PN}"
	doicon "${FILESDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"
}
