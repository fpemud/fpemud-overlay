# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="bomberman-ii"
EROM_NAME='Bomberman II'
EROM_MAIN_FILE='Bomberman II (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/AyAdZ67u9W8V5BvG4TdDdg/1585934828/nes/Bomberman%20II.7z -> ${PN}.7z"
LICENSE="unknown"
