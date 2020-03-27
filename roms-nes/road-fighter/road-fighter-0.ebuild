# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="road-fighter"
EROM_NAME='Road Fighter'
EROM_MAIN_FILE='Road Fighter (E) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/HnPukJmuihhJ-R8bYZoQ_w/1585934614/nes/Road%20Fighter.7z -> ${PN}.7z"
LICENSE="unknown"
