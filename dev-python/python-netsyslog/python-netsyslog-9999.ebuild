# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit distutils eutils git-2

EGIT_REPO_URI="http://github.com/gma/python-netsyslog.git"
PYTHON_DEPEND="2:2.6"
DISTUTILS_SRC_TEST="setup.py"

DESCRIPTION="WebSocket support for Python"
HOMEPAGE="https://github.com/gma/python-netsyslog"
LICENSE="unknown"
KEYWORDS="~amd64 ~x86"
SLOT="0"
IUSE=""
RDEPEND=""
DEPEND=""
