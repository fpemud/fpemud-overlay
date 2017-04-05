# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

EGIT_REPO_URI="https://coding.net/fpemud/fpemud-vpn-server.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Cloud VPN server for fpemud's systems"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

#         net-misc/libreswan
#         net-dialup/pptpd
RDEPEND="dev-python/pygobject
         dev-python/netifaces
         >=net-vpn/openvpn-2.4.0
         >=net-vpn/n2n-2.0.0
         net-misc/dhcp
         net-dns/dnsmasq[script]
         dev-libs/openssl
         sys-apps/net-tools
         >=net-firewall/nftables-0.5"
DEPEND=""
