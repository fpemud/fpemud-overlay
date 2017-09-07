# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2
EGIT_REPO_URI="https://coding.net/u/fpemud/p/fpemud-vcc"
DESCRIPTION="Version Control System for fpemud's Configuration"
SRC_URI=""
KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-p2p/selfnetd
         dev-python/pyinotify"
DEPEND="${RDEPEND}"
