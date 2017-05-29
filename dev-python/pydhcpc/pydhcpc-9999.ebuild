# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
PYTHON_COMPAT=( python{3_3,3_4} )

inherit distutils-r1 git-2

DESCRIPTION="Python DHCP client library based on pyroute2"
HOMEPAGE=""
EGIT_REPO_URI="https://github.com/fpemud/pydhcpc.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/pyroute2[${PYTHON_USEDEP}]
        dev-python/linuxfd[${PYTHON_USEDEP}]"
RDEPEND=""
