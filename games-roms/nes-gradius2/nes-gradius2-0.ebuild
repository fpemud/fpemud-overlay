# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="gradius-ii"
EROM_NAME="Gradius II"
EROM_MAIN_FILE='Gradius II (J).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/kq-X8e8ZXuqiEs53raNlzA/1585936581/nes/Gradius%20II.7z -> ${PN}.7z"
LICENSE="unknown"
