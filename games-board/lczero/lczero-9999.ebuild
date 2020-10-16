# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper."
HOMEPAGE="https://lczero.org"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/LeelaChessZero/lc0.git"
	EGIT_SUBMODULES=( '*' )
	inherit git-r3
else
	SRC_URI="https://github.com/LeelaChessZero/lc0/archive/v${PV}.tar.gz -> lc0-v${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/lc0-${PV}"

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
