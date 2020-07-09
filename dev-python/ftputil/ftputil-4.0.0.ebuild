# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1 python-r1 eutils

DESCRIPTION="higher-level ftp library using ftplib"
HOMEPAGE="http://ftputil.sschwarzer.net/trac/wiki"
SRC_URI="http://ftputil.sschwarzer.net/trac/raw-attachment/wiki/Download/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""
