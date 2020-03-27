# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

EROM_SITE="romhustler.org"
EROM_ID="castlevania-iii-draculas-curse"
EROM_NAME=$'Castlevania III - Dracula\'s Curse'
EROM_MAIN_FILE=$'Castlevania III - Dracula\'s Curse (U) [!].nes'
inherit nes-rom

SRC_URI="http://dl.romhustler.net/download/l6q3iupuzYwySFYd3jp_4w/1585932664/nes/Castlevania%20III%20-%20Dracula's%20Curse.7z -> ${PN}.7z"
LICENSE="unknown"
