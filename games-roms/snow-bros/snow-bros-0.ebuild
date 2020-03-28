# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID='snow-bros'
EROM_NAME='Snow Bros'
EROM_MAIN_FILE='Snow Bros (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/ERm1uN_Oc7wjGPmkjnpuEA/1585935335/nes/Snow%20Bros.7z -> ${PN}.7z"
LICENSE="unknown"
