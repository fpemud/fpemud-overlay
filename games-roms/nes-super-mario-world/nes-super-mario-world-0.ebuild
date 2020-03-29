# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romsmania.cc"
EROM_ID="super-mario-world-242484"
EROM_NAME='Super Mario World'
inherit nes-rom

SRC_URI="https://s2roms.cc/s3roms/Nintendo/UNK/Super%20Mario%20World.zip -> ${PN}.zip"
LICENSE="unknown"
