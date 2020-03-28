# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="gradius"
EROM_NAME="Gradius"
EROM_MAIN_FILE='Gradius (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/rX3meCdYePqD8shvjAYhpw/1585961865/nes/Gradius.7z -> ${PN}.7z"
LICENSE="unknown"
