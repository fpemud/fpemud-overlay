# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_1,3_2,3_3,3_4} )

inherit distutils-r1 git-2

DESCRIPTION="Library for operating ebuild2"
HOMEPAGE=""
EGIT_REPO_URI="http://github.com/fpemud/libebuild2.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
