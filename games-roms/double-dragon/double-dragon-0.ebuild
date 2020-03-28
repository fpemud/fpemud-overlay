# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='double-dragon-1'
EROM_NAME='Double Dragon'
EROM_MAIN_FILE='Double Dragon (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/ocp3uc1yaS_VfY7Pqlp89g/1585932068/nes/Double%20Dragon.7z -> ${PN}.7z"
LICENSE="unknown"
