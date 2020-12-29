# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1

DESCRIPTION="An implementation of the Python 3 asyncio event loop on top of GLib"
HOMEPAGE=""
SRC_URI="https://files.pythonhosted.org/packages/24/1c/83477e079cfcfb9cedbfbc905d72fee79604b35eec2a1b749eb9f0181733/asyncio-glib-0.1.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND=""
