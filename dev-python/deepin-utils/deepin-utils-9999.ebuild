# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit git-2 fdo-mime versionator eutils python

DESCRIPTION="Utils of DeepinUI Toolkit modules"
HOMEPAGE="http://www.linuxdeepin.com"
EGIT_REPO_URI="http://github.com/linuxdeepin/deepin-utils.git"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/python-2.7:2.7
         x11-libs/cairo
         dev-python/pycairo
         x11-libs/gtk+:2
         dev-python/pygtk:2
         net-libs/webkit-gtk:2
         dev-python/python-xlib"
DEPEND="${RDEPEND}
        dev-python/setuptools"

pkg_setup() {
	python_set_active_version 2.7
}

src_install() {
	python setup.py install --root=${D} || die "Install failed"
}
