# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE='romhustler.org'
EROM_ID='tekken-2'
EROM_NAME='Tekken 2'
EROM_MAIN_FILE='Tekken 2 [p1][b5].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/YVUrj9Gnj75oHxmhKrOoZA/1585991009/nes/Tekken%202.7z -> ${PN}.7z"
LICENSE="unknown"
