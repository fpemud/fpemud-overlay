# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit gnome2-utils git-r3

DESCRIPTION="Icon theme for Linux Mint"
HOMEPAGE="https://github.com/linuxmint/mint-x-icons"
EGIT_REPO_URI="https://github.com/linuxmint/mint-x-icons.git"

LICENSE="GPL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

RESTRICT="binchecks strip"

src_install() {
	doins -r usr
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
