# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/rshelld-cli.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Remote Shell Server - CLI"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/paramiko"
DEPEND=""
