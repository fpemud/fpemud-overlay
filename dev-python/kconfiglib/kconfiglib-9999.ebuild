# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

SUPPORT_PYTHON_ABIS="1"
PYTHON_DEPEND="2"
EGIT_REPO_URI="http://github.com/fpemud/Kconfiglib.git"
#EGIT_REPO_URI="http://github.com/ulfalizer/Kconfiglib.git"

inherit distutils git-2

DESCRIPTION="A flexible Python Kconfig parser"
HOMEPAGE="https://github.com/ulfalizer/Kconfiglib"
SRC_URI=""
#SRC_URI="https://github.com/ulfalizer/Kconfiglib/zipball/master"

LICENSE="PYTHON"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""
RESTRICT_PYTHON_ABIS="3.*"

src_install() {
	distutils_src_install
}

