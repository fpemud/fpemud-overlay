# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME='Mega Man 6'
EROM_MAIN_FILE='Mega Man 6 (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/rZdTGaT948NnGXy_aqDK9w/1585932977/nes/Mega%20Man%206.7z -> ${PN}.7z"
LICENSE="unknown"
