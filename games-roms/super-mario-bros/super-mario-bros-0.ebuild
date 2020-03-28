# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romsmania.cc"
EROM_ID="${PN}-242404"
EROM_NAME='Super Mario Bros'
inherit nes-rom

SRC_URI="https://s2roms.cc/s3roms/Nintendo/USA/P-T/Super%20Mario%20Bros%20%28E%29.zip -> ${PN}.zip"
LICENSE="unknown"
