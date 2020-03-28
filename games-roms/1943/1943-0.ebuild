# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="1943-the-battle-of-midway"
EROM_NAME="1943 - The Battle of Midway"
EROM_MAIN_FILE='1943 - The Battle of Midway (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/Nd4yVHRty0UwtE0xP6zjKg/1585936673/nes/1943%20-%20The%20Battle%20of%20Midway.7z -> ${PN}.7z"
LICENSE="unknown"
