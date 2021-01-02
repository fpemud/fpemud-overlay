# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1 git-r3

DESCRIPTION="Python module used for operating passwd/group/shadow in a strict manner"
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/mirrorshq/public-mirror-db-tools.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/jsonschema
        dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
