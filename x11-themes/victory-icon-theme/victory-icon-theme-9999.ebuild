# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3

DESCRIPTION="Victory Icon Theme, A Gtk Icon Theme for Linux"
HOMEPAGE="https://github.com/newhoa/victory-icon-theme"
EGIT_REPO_URI="https://github.com/newhoa/victory-icon-theme.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_install() {
    dodir usr
    doins -r usr
}
