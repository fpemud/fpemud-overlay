# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

EGIT_REPO_URI="http://github.com/fpemud/fpemud-cloudvpn-server.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=">=net-misc/openvpn-2.3.8
         net-dns/dnsmasq
         net-dns/dnscrypt-proxy
         dev-libs/openssl
         >=net-firewall/nftables-0.5"
DEPEND=""
