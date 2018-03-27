# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Manage networkmanager connections in a managed way"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/bombyx.git"

KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pyroute2"
DEPEND="${RDEPEND}"
