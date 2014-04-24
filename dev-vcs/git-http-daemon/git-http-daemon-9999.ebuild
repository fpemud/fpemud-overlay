# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

EGIT_REPO_URI="git://github.com/fpemud/git-http-daemon.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="git http daemon --fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="www-servers/apache
         www-apache/mod_authnz_external
         www-apache/pwauth"
DEPEND=""
