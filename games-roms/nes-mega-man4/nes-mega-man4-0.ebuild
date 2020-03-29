# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="mega-man-4"
EROM_NAME='Mega Man 4'
EROM_MAIN_FILE='Mega Man 4 (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/Yzj9zBAxsVHVL-CMzoY6Bw/1585933927/nes/Mega%20Man%204.7z -> ${PN}.7z"
LICENSE="unknown"
