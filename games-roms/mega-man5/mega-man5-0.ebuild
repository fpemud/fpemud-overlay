# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="mega-man-5"
EROM_NAME='Mega Man 5'
EROM_MAIN_FILE='Mega Man 5 (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/mUwODNVoUD5OLmMSYvxdaw/1585934250/nes/Mega%20Man%205.7z -> ${PN}.7z"
LICENSE="unknown"
