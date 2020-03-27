# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romsmania.cc"
EROM_ID="super-mario-bros-2-242428"
EROM_NAME='Super Mario Bros 2'
inherit nes-rom

SRC_URI="https://s2roms.cc/s3roms/Nintendo/USA/P-T/Super%20Mario%20Bros%202%20%28E%29%20%5B%21%5D.zip -> ${PN}.zip"
LICENSE="unknown"
