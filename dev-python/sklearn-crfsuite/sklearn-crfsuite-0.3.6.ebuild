# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1

DESCRIPTION="sklearn-crfsuite is a thin CRFsuite (python-crfsuite) wrapper which provides interface simlar to scikit-learn."
HOMEPAGE=""
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/python-crfsuite[${PYTHON_USEDEP}]
        dev-python/tabulate[${PYTHON_USEDEP}]
        dev-python/tqdm[${PYTHON_USEDEP}]"
RDEPEND=""
