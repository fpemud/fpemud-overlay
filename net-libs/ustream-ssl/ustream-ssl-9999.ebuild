# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://git.openwrt.org/project/${PN}.git"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="mbedtls wolfssl +openssl"

DEPEND="
	dev-libs/libubox
	mbedtls? ( net-libs/mbedtls )
	wolfssl? ( net-libs/wolfssl )
	openssl? ( dev-libs/openssl )
"
RDEPEND="$DEPEND"

src_prepare() {
	cmake-utils_src_prepare
	sed -i 's/LIBRARY DESTINATION lib//' CMakeLists.txt
	sed -i 's/-Werror //' CMakeLists.txt
}

src_configure() {
	local mycmakeargs=(
		-DMBEDTLS=$(usex mbedtls ON OFF)
		-DWOLFSSL=$(usex wolfssl ON OFF)
	)

	cmake-utils_src_configure
}
