# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_5,3_6} )

inherit distutils-r1 git-2

DESCRIPTION="A utility for rqalpha history"
HOMEPAGE="https://github.com/shidenggui/easyhistory"
EGIT_REPO_URI="https://github.com/shidenggui/easyhistory"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/easyutils"
RDEPEND=""
