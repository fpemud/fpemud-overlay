# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="A PyPI mirror client according to PEP 381"
HOMEPAGE=""
SRC_URI="https://files.pythonhosted.org/packages/64/e1/ad7d32ee75c4b94b64946e2a3d7548659fb3614fd0b58204647410023bb1/bandersnatch-4.0.3.tar.gz"

LICENSE="AFL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/aiohttp-xmlrpc
        dev-python/filelock
        dev-python/importlib_resources
        dev-python/typing-extensions"
RDEPEND=""
