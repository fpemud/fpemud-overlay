# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1 git-r3

DESCRIPTION="A chess GUI to play against chess engines"
HOMEPAGE="http://johncheetham.com/projects/jcchess"
EGIT_REPO_URI="https://github.com/johncheetham/jcchess.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
