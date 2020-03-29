# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="castlevania-ii-simons-quest"
EROM_NAME=$'Castlevania II - Simon\'s Quest'
EROM_MAIN_FILE=$'Castlevania II - Simon\'s Quest (U).nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/RLBq4jlWHrp6r56EYx0qsg/1585934058/nes/Castlevania%20II%20-%20Simon's%20Quest.7z -> ${PN}.7z"
LICENSE="unknown"
