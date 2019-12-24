# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7} )

inherit distutils-r1

DESCRIPTION="ftp client/server for asyncio"
HOMEPAGE=""
SRC_URI="https://files.pythonhosted.org/packages/83/d5/f6b10ec9d582f994fb98ea677f8c1f8e68a6e47914d74d716399f95cb699/aioftp-0.13.0.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
