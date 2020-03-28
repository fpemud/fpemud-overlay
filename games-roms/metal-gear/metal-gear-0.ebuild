# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME="Metal Gear"
EROM_MAIN_FILE='Metal Gear (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/4Xb0kzkEsep2VV9WCyMLwQ/1585935970/nes/Metal%20Gear.7z -> ${PN}.7z"
LICENSE="unknown"
