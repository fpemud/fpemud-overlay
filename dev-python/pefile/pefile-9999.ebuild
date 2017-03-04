# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5} )

inherit distutils-r1 git-2

DESCRIPTION="pefile is a Python module to read and work with PE (Portable Executable) files"
HOMEPAGE="https://github.com/erocarrera/pefile"
EGIT_REPO_URI="https://github.com/erocarrera/pefile.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE=""

DEPEND="dev-python/future
        dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
