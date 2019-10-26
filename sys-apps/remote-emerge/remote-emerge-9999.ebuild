# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="Emerge remotely using syncupd"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/remote-emerge"

KEYWORDS="x86 amd64"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="
         net-misc/stunnel
         sys-apps/portage
         dev-python/pyopenssl"
DEPEND="${RDEPEND}
        virtual/pkgconfig"
