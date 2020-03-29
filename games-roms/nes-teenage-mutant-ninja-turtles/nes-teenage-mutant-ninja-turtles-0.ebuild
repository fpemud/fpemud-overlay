# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE='romhustler.org'
EROM_ID='teenage-mutant-ninja-turtles-1'
EROM_NAME='Teenage Mutant Ninja Turtles'
EROM_MAIN_FILE='Teenage Mutant Ninja Turtles (U) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/pPA8FKxAYhtE4RZQotdNKg/1585932471/nes/Teenage%20Mutant%20Ninja%20Turtles.7z -> ${PN}.7z"
LICENSE="unknown"
