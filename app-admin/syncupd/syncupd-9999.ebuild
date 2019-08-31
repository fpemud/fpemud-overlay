# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/syncupd.git"
SRC_URI=""

DESCRIPTION="Gentoo Build Server"
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pyopenssl"
DEPEND=""
