# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romsmania.cc"
EROM_ID="${PN}-241116"
EROM_NAME='Ice Climber'
inherit nes-rom

SRC_URI="https://s2roms.cc/s3roms/Nintendo/USA/G-K/Ice%20Climber%20%28U%29.zip -> ${PN}.zip"
LICENSE="unknown"
