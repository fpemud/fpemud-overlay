# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

EGIT_REPO_URI="https://github.com/fpemud/fpemud-rshelld.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Fpemud's Remote CLI Shell"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/openssh"
DEPEND=""
