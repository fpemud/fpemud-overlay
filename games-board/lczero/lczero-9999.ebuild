# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson git-r3

DESCRIPTION="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper."
HOMEPAGE="https://lczero.org"
EGIT_REPO_URI="https://github.com/LeelaChessZero/lc0.git"
EGIT_SUBMODULES=( '*' )

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="sci-libs/tensorflow"

