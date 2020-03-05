# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://git.openwrt.org/project/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

COMMON_DEPEND="
	dev-libs/libubox
	sys-apps/ubus
"
DEPEND="
	${COMMON_DEPEND}
"

src_prepare() {
	cmake-utils_src_prepare
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install

	install -d "${D}/etc/config"
}
