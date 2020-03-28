# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='battle-tank'
EROM_NAME='Battle Tank'
EROM_MAIN_FILE='Battle Tank (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/C4ynUw-Imk4NFF8juQxkSw/1585934726/nes/Battle%20Tank.7z -> ${PN}.7z"
LICENSE="unknown"
