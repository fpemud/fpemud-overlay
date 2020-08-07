# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8} )

inherit distutils-r1 git-r3

DESCRIPTION="An experimental git web manager"
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/fklaus"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="ctags"

RDEPEND="
        !www-apps/klaus
	>=dev-python/dulwich-0.19.3[${PYTHON_USEDEP}]
	dev-python/flask[${PYTHON_USEDEP}]
	dev-python/httpauth[${PYTHON_USEDEP}]
	dev-python/humanize[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	ctags? ( dev-python/python-ctags[${PYTHON_USEDEP}] )
"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

# The tests can only be run from a git repository
# so they are not included in the source distributions

python_install_all() {
	distutils-r1_python_install_all
	doman klaus.1
}
