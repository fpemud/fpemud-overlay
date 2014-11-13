# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit git-2 eutils python

DESCRIPTION="An incomplete xcb-util port plus some extras"
HOMEPAGE="http://github.com/BurntSushi/xpybutil"
EGIT_REPO_URI="http://github.com/BurntSushi/xpybutil.git"

LICENSE="WTFPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/xpyb"
DEPEND="${RDEPEND}
        dev-python/setuptools"

pkg_setup() {
	python_set_active_version 2.7
}

src_install() {
	python setup.py install --root=${D} || die "Install failed"
}
