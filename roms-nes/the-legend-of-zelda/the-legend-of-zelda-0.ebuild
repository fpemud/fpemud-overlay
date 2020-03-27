# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romsmania.cc"
EROM_ID="zelda-the-legend-of-zelda-242911"
EROM_NAME='The Legend Of Zelda'
inherit nes-rom

SRC_URI="https://s2roms.cc/s3roms/Nintendo/USA/U-Z/Zelda%20-%20The%20Legend%20of%20Zelda.zip -> ${PN}.zip"
LICENSE="unknown"
