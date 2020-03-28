# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="street-fighter-iii"
EROM_NAME='Street Fighter III'
EROM_MAIN_FILE='Street Fighter III [p1][!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/kbdOdGHi_A6IHsfN1poguw/1585935974/nes/Street%20Fighter%20III.7z -> ${PN}.7z"
LICENSE="unknown"
