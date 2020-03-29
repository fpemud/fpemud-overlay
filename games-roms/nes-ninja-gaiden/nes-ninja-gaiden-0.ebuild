# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE='romhustler.org'
EROM_ID='ninja-gaiden-1'
EROM_NAME='Ninja Gaiden'
EROM_MAIN_FILE='Ninja Gaiden (U) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/bKKrLAkagBF7xmjjWEvuvw/1586057258/nes/Ninja%20Gaiden.7z -> ${PN}.7z"
LICENSE="unknown"
