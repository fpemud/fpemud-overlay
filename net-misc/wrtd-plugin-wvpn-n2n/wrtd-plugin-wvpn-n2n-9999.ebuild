# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/wrtd-plugin-wvpn-n2n"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/wrtd
         net-misc/wrtd-plugin-manager-cascade
         net-misc/dhcp[client]
         net-vpn/n2n"
DEPEND=""
