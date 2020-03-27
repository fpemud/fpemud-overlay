# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="${PN}"
EROM_NAME='Battle City'
EROM_MAIN_FILE='Battle City (J).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/J6-LMFUvW0QqZJTVN3quFw/1585931591/nes/Battle%20City.7z -> ${PN}.7z"
LICENSE="unknown"
