# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Up to date simple useragent faker with real world database"
HOMEPAGE=""
SRC_URI="https://pypi.python.org/packages/59/18/af4b6a003a7a1039993431be0fce165633af4cfd25ff936e5193d16bb390/fake-useragent-0.1.5.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
