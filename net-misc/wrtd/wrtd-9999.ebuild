# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/wrtd"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pygobject
         dev-python/netifaces
         dev-python/pyroute2
         dev-python/toposort
         dev-python/python-iptables
         net-dns/dnsmasq
         net-fs/samba
         net-misc/wakeonlan
         >=sys-apps/iproute2-2.6.34"
DEPEND=""
