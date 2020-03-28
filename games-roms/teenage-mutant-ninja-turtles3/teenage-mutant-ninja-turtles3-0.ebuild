# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME='Teenage Mutant Ninja Turtles III - The Manhattan Project'
EROM_MAIN_FILE='Teenage Mutant Ninja Turtles III - The Manhattan Project (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/KwizZNzBRIgWdKwmudeAow/1585934311/nes/Teenage%20Mutant%20Ninja%20Turtles%20III%20-%20The%20Manhattan%20Project.7z -> ${PN}.7z"
LICENSE="unknown"
