# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} )

inherit distutils-r1 git-r3

DESCRIPTION="Works with Linux namespaces through glibc with pure python."
HOMEPAGE="https://github.com/Friz-zy/pyspaces"
EGIT_REPO_URI="https://github.com/Friz-zy/pyspaces.git"

LICENSE="MIT"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
SLOT="0"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        app-text/pandoc"
RDEPEND=""

