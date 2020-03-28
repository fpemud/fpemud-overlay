# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME='Mega Man'
EROM_MAIN_FILE='Mega Man (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/QTGFh5W6plk8EAtoq0ExGA/1585928472/nes/Mega%20Man.7z -> ${PN}.7z"
LICENSE="unknown"
