# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils git-r3

DESCRIPTION="A set of tracks for ${CATEGORY}/${P//-tracks}"
HOMEPAGE="https://stuntrally.tuxfamily.org/"

SLOT="0"
LICENSE="GPL-3"
IUSE=""

SRC_URI=""
KEYWORDS=""
EGIT_REPO_URI="https://github.com/stuntrally/tracks"
EGIT_PROJECT="${PN}"
# Shallowing, since we don't want to fetch few GB of history
#EGIT_OPTIONS="--depth 1"

src_configure() {
	local mycmakeargs+=(
		-DSHARE_INSTALL="/usr/share/stuntrally"
	)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
}
