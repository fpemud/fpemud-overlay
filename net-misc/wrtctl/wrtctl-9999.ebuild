# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

EGIT_REPO_URI="https://github.com/flexWRT/wrtctl"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Command line control interface for WRTD"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/wrtd"
DEPEND=""
