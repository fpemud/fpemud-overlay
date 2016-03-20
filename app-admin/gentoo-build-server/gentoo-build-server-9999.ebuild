# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

EGIT_REPO_URI="https://github.com/fpemud/gentoo-build-server.git"
inherit git-2
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Gentoo Build Server"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/openssh
         www-servers/apache
         www-apache/mod_wsgi"
DEPEND=""
