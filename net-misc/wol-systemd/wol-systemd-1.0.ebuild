# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

KEYWORDS="-* amd64 x86"
DESCRIPTION="A systemd unit file for enabling Wake-On-LAN automatically"
LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND="sys-apps/systemd
         sys-apps/ethtool"
DEPEND=""

S="${WORKDIR}"

src_prepare() {
	return
}

src_install() {
	dodir "/usr/lib/systemd/system"
	cp "${FILESDIR}/target.service" "${D}/usr/lib/systemd/system/wol@.service"
}
