# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE='romhustler.org'
EROM_ID='batman-1'
EROM_NAME='Batman'
EROM_MAIN_FILE='Batman (U) (Prototype).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/2poA4Y8ykuVVF8iQ16lNyA/1586064955/nes/Batman.7z -> ${PN}.7z"
LICENSE="unknown"
