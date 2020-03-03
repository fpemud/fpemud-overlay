# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-libs/libnl/libnl-3.2.9999.ebuild,v 1.1 2013/10/23 10:58:30 jer Exp $

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://git.openwrt.org/project/${PN}.git"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

src_prepare() {
	cmake-utils_src_prepare
	sed -i 's/ARCHIVE DESTINATION lib//' CMakeLists.txt
	sed -i 's/LIBRARY DESTINATION lib//' CMakeLists.txt
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_LUA=OFF
	)

	cmake-utils_src_configure
}
