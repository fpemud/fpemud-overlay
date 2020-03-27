# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME="Chip 'n Dale Rescue Rangers 2"
EROM_MAIN_FILE=$'Chip \'n Dale Rescue Rangers 2 (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/7NYlWRP-7pKWlody7IIv4Q/1585936283/nes/Chip%20'n%20Dale%20Rescue%20Rangers%202.7z -> ${PN}.7z"
LICENSE="unknown"
