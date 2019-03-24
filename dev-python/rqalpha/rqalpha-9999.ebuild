# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_5,3_6,3_7} )

inherit distutils-r1 git-r3

DESCRIPTION="Ricequant Algorithm Trading System"
HOMEPAGE="http://rqalpha.io"
#EGIT_REPO_URI="https://github.com/ricequant/rqalpha"
EGIT_REPO_URI="https://github.com/fpemud/rqalpha"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

#        >=dev-python/xlsxwriter-0.9.6
#        =dev-python/logbook-1.0.0
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/requests
        >=dev-python/numpy-1.11.1
        >=dev-python/pandas-0.18.1
        >=dev-python/python-dateutil-2.5.3
        >=dev-python/pytz-2016.4
        >=dev-python/six-1.10.0
        >=dev-python/pytest-2.9.2
        >=dev-python/click-6.6
        >=dev-python/bcolz-1.1.0
        >=dev-python/matplotlib-1.5.1
        >=dev-python/jsonpickle-0.9.3
        >=dev-python/simplejson-3.10.0
        =dev-python/dill-0.2.5
        >=dev-python/xlsxwriter-0.9.2
        >=dev-python/line_profiler-2.0
        >=dev-python/pyyaml-3.12
        =dev-python/jsonpickle-0.9.4
        dev-python/tabulate
        dev-python/rqrisk"
RDEPEND=""

src_prepare() {
	rm -rf tests
	eapply_user
}
