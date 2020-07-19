# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

PYTHON_COMPAT=( python3_{5,6,7,8,9} )

inherit distutils-r1

DESCRIPTION="Implements JSON-RPC 2.0 Specification using aiohttp"
HOMEPAGE="https://github.com/pengutronix/aiohttp-json-rpc"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT=""

RDEPEND="
	>=dev-python/aiohttp-3.4[${PYTHON_USEDEP}]
"
DEPEND="
	${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
"
