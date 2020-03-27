# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME=$'Hudson\'s Adventure Island'
EROM_MAIN_FILE=$'Hudson\'s Adventure Island (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/iKwGE8Mm1JHQxGFc0UdaSw/1585935327/nes/Hudson's%20Adventure%20Island.7z -> ${PN}.7z"
LICENSE="unknown"
