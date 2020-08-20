# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/pservers.git"
SRC_URI=""

DESCRIPTION="--fixme"
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="acct-user/pservers
         acct-group/pservers
         dev-python/dbus-python"
RDEPEND="${RDEPEND}
         www-servers/apache
         dev-python/pyftpdlib"
DEPEND=""
