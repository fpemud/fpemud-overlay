# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4,3_5} )

inherit distutils-r1 eutils git-2

DESCRIPTION="Python bindings for Linux's fanotify API"
HOMEPAGE="https://github.com/google/python-fanotify"
EGIT_REPO_URI="https://github.com/google/python-fanotify.git"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
