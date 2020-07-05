# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7} )

inherit distutils-r1 git-r3

DESCRIPTION="Crawl slowly"
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/fpemud/manpa.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/fake-useragent[${PYTHON_USEDEP}]
        dev-python/xvfbwrapper[${PYTHON_USEDEP}]
        dev-python/selenium[${PYTHON_USEDEP}]
        www-client/google-chrome
        www-apps/chromedriver-bin
        net-misc/fake-useragent-db"
RDEPEND=""
