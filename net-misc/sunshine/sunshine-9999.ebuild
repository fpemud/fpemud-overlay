# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="Sunshine is a Gamestream host for Moonlight"
HOMEPAGE="https://github.com/loki-47-6F-64/sunshine"
EGIT_REPO_URI="https://github.com/loki-47-6F-64/sunshine.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

#src_prepare() {
#	cmake-utils_src_prepare
#	sed -i 's/-Werror //' CMakeLists.txt
#	echo 'INCLUDE_DIRECTORIES(/usr/include/libnl3)' >> CMakeLists.txt
#}

#src_configure() {
#	cmake-utils_src_configure
#}

#src_install() {
#	cmake-utils_src_install
#
#	install -d "${D}/etc/config"
#	touch "${D}/etc/config/network"
#	touch "${D}/etc/config/wireless"
#}
