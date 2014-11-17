# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
DISTUTILS_OPTIONAL=1

inherit git-2 distutils-r1 qmake-utils

DESCRIPTION="Menu service for Linux Deepin"
HOMEPAGE="https://github.com/linuxdeepin/deepin-menu"
EGIT_REPO_URI="http://github.com/linuxdeepin/deepin-menu.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	distutils-r1_src_prepare
}

src_configure() {
	echo "debug1"
	eqmake5
	echo "debug2"
	distutils-r1_src_configure
}

src_compile() {
	echo "debug3"
	emake
	echo "debug4"
	distutils-r1_src_compile
}

src_install() {
	emake INSTALL_ROOT="${D}" install
	distutils-r1_src_install
}

