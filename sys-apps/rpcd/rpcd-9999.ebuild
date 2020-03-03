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

DEPEND="
	dev-libs/libubox
	sys-apps/ubus
	sys-apps/uci
"

src_prepare() {
	cmake-utils_src_prepare
	sed -i 's/LIBRARY DESTINATION lib/LIBRARY DESTINATION lib64/' CMakeLists.txt
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	# FIXME: which depends on sys-apps/iwinfo
	local mycmakeargs=(
		-DIWINFO_SUPPORT=OFF
	)

	cmake-utils_src_configure
}
