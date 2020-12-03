# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1 git-r3

EGIT_REPO_URI="https://github.com/fpemud/partner"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pygobject
         dev-python/toposort"
DEPEND=""

# install partner program by make
# install partner python module by distutils

src_prepare() {
	distutils-r1_src_prepare
}

src_compile() {
	emake || die "emake failed"
	distutils-r1_src_compile
}

src_install() {
	emake DESTDIR="${D}" install
	distutils-r1_src_install
}

