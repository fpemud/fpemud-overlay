# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='super-contra7'
EROM_NAME='Super Contra 7'
EROM_MAIN_FILE='Super Contra 7 (Unl) [p1][t1].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/FZoHddsJifuHt-TDrWeD2g/1585935141/nes/Super%20Contra%207.7z -> ${PN}.7z"
LICENSE="unknown"
