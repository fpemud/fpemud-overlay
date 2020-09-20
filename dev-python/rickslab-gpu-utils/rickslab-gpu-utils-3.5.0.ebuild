# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1 python-r1 eutils

DESCRIPTION="A set of utilities for monitoring GPU performance and modifying control settings."
HOMEPAGE="https://github.com/Ricks-Lab/gpu-utils"
SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="amd64 ppc x86 ~x86-fbsd"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/gpu-utils-${PV}
