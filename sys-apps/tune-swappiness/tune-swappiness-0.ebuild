# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Tune swappiness when boot"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sys-apps/systemd"
DEPEND=""

S=$WORKDIR

src_install() {
	mkdir -p "${D}/usr/lib/systemd/system"
	mkdir -p "${D}/usr/lib/systemd/system/sysinit.target.wants"
	cp "${FILESDIR}/tune-swappiness.service" "${D}/usr/lib/systemd/system"
	ln -s "../tune-swappiness.service" "${D}/usr/lib/systemd/system/sysinit.target.wants"
}
