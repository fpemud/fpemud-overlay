# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7,3_2,3_3,3_4,3_5} )

inherit distutils-r1 git-2

DESCRIPTION=""
HOMEPAGE="https://github.com/shidenggui/easytrader"
EGIT_REPO_URI="https://github.com/shidenggui/easytrader"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/demjson"
RDEPEND=""
