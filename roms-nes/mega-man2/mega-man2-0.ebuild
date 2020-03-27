# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME='Mega Man 2'
EROM_MAIN_FILE='Mega Man 2 (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/TDcaUtBlFrLmw8qZFcSiZw/1585931335/nes/Mega%20Man%202.7z -> ${PN}.7z"
LICENSE="unknown"
