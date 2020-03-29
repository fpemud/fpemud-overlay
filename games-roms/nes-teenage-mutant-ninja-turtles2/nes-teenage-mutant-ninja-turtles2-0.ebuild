# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="teenage-mutant-ninja-turtles-ii-the-arcade-game"
EROM_NAME='Teenage Mutant Ninja Turtles II'
EROM_MAIN_FILE='Teenage Mutant Ninja Turtles II - The Arcade Game (U) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/_lhedYqhgEVC6aa4gK-mLQ/1585962381/nes/Teenage%20Mutant%20Ninja%20Turtles%20II%20-%20The%20Arcade%20Game.7z -> ${PN}.7z"
LICENSE="unknown"
