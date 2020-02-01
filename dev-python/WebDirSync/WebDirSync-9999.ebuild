# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1 git-r3

DESCRIPTION="Synchronize web directory (http/https/ftp)"
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/mirrorshq/WebDirSync.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
