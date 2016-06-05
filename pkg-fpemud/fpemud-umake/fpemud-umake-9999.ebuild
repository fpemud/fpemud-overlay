# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

EGIT_REPO_URI="https://github.com/fpemud/fpemud-umake.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Make install media in fpemud's way"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="virtual/cdrtools
         dev-python/pyftpdlib
         sys-boot/syslinux"
DEPEND=""
