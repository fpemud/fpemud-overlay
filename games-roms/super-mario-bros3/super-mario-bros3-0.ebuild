# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romsmania.cc"
EROM_ID="super-mario-bros-3-242459"
EROM_NAME='Super Mario Bros 3'
inherit nes-rom

SRC_URI="https://s2roms.cc/s3roms/Nintendo/Hacks/M-Z/Super%20Mario%20Bros%203%20%28U%29%20%28PRG%201%29%20%5Bh2%5D.zip -> ${PN}.zip"
LICENSE="unknown"
