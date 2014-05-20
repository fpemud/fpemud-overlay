# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

KEYWORDS="-* amd64 x86"
DESCRIPTION="NetworkManager dispatcher for creating upnp port mapping of ssh service"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-libs/miniupnpc"
DEPEND=""

src_prepare() {
	return
}

src_install() {
	dodir "/etc/NetworkManager/dispatcher.d"
	cp "${FILESDIR}/10-fpemud-upnpc-ssh" "${D}/etc/NetworkManager/dispatcher.d"
	chmod 755 "${D}/etc/NetworkManager/dispatcher.d/10-fpemud-upnpc-ssh"
}
