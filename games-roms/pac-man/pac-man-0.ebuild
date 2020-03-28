# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='pac-man'
EROM_NAME='Pac-Man'
EROM_MAIN_FILE='Pac-Man (U) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/H8f3NWJnNTT4J7XIZbU0Sg/1585933585/nes/Pac-Man.7z -> ${PN}.7z"
LICENSE="unknown"
