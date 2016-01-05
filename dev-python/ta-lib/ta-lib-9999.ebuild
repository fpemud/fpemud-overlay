# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4} )

inherit distutils-r1 git-2

DESCRIPTION="Python wrapper for TA-Lib"
HOMEPAGE="http://mrjbq7.github.io/ta-lib"
EGIT_REPO_URI="http://github.com/fpemud/ta-lib"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="sci-libs/ta-lib
         dev-python/numpy"
