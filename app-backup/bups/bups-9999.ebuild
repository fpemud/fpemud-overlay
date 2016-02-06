# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python{2_6,2_7} )

inherit distutils-r1 git-2

DESCRIPTION="Simple GUI for Bup, a very efficient backup system"
HOMEPAGE="https://github.com/emersion/bups"
EGIT_REPO_URI="https://github.com/emersion/bups.git"
KEYWORDS="~x86 ~amd64"

LICENSE="MIT"
SLOT="0"
IUSE=""

DEPEND="sys-devel/gettext"
RDEPEND="app-backup/bup"

src_prepare() {
	tools/makemo.sh
}

