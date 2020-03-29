# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE='romhustler.org'
EROM_ID='battletoads-1'
EROM_NAME='Battletoads'
EROM_MAIN_FILE='Battletoads (U) [b1].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/xo16tFxYLiDu5PvnBfuSjQ/1586065369/nes/Battletoads.7z -> ${PN}.7z"
LICENSE="unknown"
