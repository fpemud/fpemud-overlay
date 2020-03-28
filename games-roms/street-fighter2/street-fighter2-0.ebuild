# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="street-fighter-ii"
EROM_NAME='Street Fighter II'
EROM_MAIN_FILE='Master Fighter 2 [p1][a2].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/lf0nqjg0gdF2vq3bMvmwkQ/1585931944/nes/Street%20Fighter%20II.7z -> ${PN}.7z"
LICENSE="unknown"
