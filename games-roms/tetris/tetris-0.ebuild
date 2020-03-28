# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='tetris'
EROM_NAME='Tetris'
EROM_MAIN_FILE='Tetris (U) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/cC0Tj72Mu5rdSUaZ0JcfFw/1585931584/nes/Tetris.7z -> ${PN}.7z"
LICENSE="unknown"
