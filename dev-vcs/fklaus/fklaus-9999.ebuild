# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 user git-r3

EGIT_REPO_URI="https://github.com/fpemud/fklaus.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="an experimental git web manager"
LICENSE="ISC"
SLOT="0"
IUSE="ctags"

RDEPEND="
	>=dev-python/dulwich-0.19.3[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/httpauth[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	ctags? ( dev-python/python-ctags[${PYTHON_USEDEP}] )
"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

pkg_setup() {
	enewgroup git
	enewuser git -1 /bin/sh /var/git git
}

python_install_all() {
	distutils-r1_python_install_all
	doman ${PN}.1
}

