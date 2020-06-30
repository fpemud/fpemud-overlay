# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="6"

inherit git-r3

DESCRIPTION="A simple virtual machine dbus service provider"
EGIT_REPO_URI="https://github.com/fpemud/virt-service.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/netifaces
         dev-python/pyroute2
         net-dns/dnsmasq
         net-fs/samba
         >=sys-apps/iproute2-2.6.34
         >=net-firewall/nftables-0.5"
DEPEND=""
