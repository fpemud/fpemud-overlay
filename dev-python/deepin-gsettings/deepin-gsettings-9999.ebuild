# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit fdo-mime versionator eutils python git-2

DESCRIPTION="Deepin gsettings Python Bindings"
HOMEPAGE="http://www.linuxdeepin.com"
EGIT_REPO_URI="http://github.com/linuxdeepin/deepin-gsettings.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/python:2.7
		dev-libs/glib"
DEPEND="${RDEPEND}
		dev-python/setuptools"
S=${WORKDIR}/${PN}-${MY_VER}

pkg_setup() {
	python_set_active_version 2.7
}

src_install() {

	python setup.py install --root=${D} || die "Install failed"
}
