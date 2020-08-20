# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/pservers-plugin-fpemud-git-private.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="pservers plugin for hosting fpemud's git repositories"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/pservers"
DEPEND=""
