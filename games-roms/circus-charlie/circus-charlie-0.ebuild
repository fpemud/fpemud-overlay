# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="circus-charlie"
EROM_NAME="Circus Charlie"
EROM_MAIN_FILE='Circus Charlie (J).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/0ie5JfJw9bXjweT_giQssw/1585962355/nes/Circus%20Charlie.7z -> ${PN}.7z"
LICENSE="unknown"
