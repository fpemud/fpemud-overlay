# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME="Duck Hunt"
EROM_MAIN_FILE='Duck Hunt (JUE) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/moeOaSODsxheZ6eam5gACg/1585935820/nes/Duck%20Hunt.7z -> ${PN}.7z"
LICENSE="unknown"
