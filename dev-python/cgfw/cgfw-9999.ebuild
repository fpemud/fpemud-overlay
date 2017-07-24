# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4,3_5} )

inherit distutils-r1 git-2

DESCRIPTION="CGFW"
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/fpemud/cgfw.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="dev-python/netifaces
         net-dialup/pptpclient"

src_install() {
	distutils-r1_src_install

	dodir "/usr/share/cgfw"
	cp -r share/* "${D}/usr/share/cgfw"
}
