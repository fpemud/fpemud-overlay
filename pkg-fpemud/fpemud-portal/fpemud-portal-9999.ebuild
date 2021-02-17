# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit user git-r3

EGIT_REPO_URI="https://github.com/fpemud/fpemud-portal.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=www-servers/apache-2.4.9
         dev-python/pyopenssl
         www-apps/gitlabhq
         www-apache/passenger"
DEPEND=""

pkg_setup() {
	enewgroup fpemud-portal
	enewuser fpemud-portal -1 /bin/sh /var/git git
}
