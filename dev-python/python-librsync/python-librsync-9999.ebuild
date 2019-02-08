# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_3,3_4,3_5,3_6,3_7} )

inherit distutils-r1 eutils git-r3

DESCRIPTION="Ctypes wrapper for librsync."
HOMEPAGE="https://github.com/jaknb/python-librsync"
EGIT_REPO_URI="https://github.com/jaknb/python-librsync.git"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        net-libs/librsync"
RDEPEND=""
