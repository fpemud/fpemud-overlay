# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='mega-man3'
EROM_NAME='Mega Man 3'
EROM_MAIN_FILE='Mega Man 3 (U) [o1].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/U5YFM2v4jwRUbAcdur7lLg/1585932238/nes/Mega%20Man%203.7z -> ${PN}.7z"
LICENSE="unknown"
