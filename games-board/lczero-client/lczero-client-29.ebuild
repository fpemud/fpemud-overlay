# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit golang-build

EGO_PN="github.com/LeelaChessZero/lczero-client/..."
DESCRIPTION="The executable that communicates with the server to run selfplay games locally and upload results."
HOMEPAGE="https://lczero.org"
SRC_URI="https://github.com/LeelaChessZero/lczero-client/archive/v${PV}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"


LICENSE="GPL-3"
SLOT="0"
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
