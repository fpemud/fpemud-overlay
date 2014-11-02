# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Simple script to ease the configuration process of fpemud's VPN"
SRC_URI=""
EGIT_REPO_URI="http://github.com/fpemud/fpemud-vpn-config.git"

KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pyopenssl
         net-misc/openvpn
         net-misc/networkmanager-openvpn"
DEPEND=""
