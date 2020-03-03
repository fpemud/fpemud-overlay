# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://git.openwrt.org/project/${PN}.git"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
#DEPEND="
#	dev-libs/libubox
#"

src_prepare() {
	default
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_LUA=OFF
	)

	cmake-utils_src_configure
}
