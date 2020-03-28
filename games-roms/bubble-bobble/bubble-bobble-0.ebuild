# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="bubble-bobble"
EROM_NAME='Bubble Bobble'
EROM_MAIN_FILE='Bubble Bobble (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/AGxxkz09aOqbRg4txho_uw/1585935042/nes/Bubble%20Bobble.7z -> ${PN}.7z"
LICENSE="unknown"
