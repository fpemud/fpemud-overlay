# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The .iso image of CentOS 7 setup DVD (x86_64)"
HOMEPAGE="https://www.centos.org"
SRC_URI="http://buildlogs.centos.org/rolling/7/isos/x86_64/CentOS-7-x86_64-DVD-1511.iso"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	insinto "/usr/share/${PN%-*}"
	doins "${DISTDIR}/CentOS-7-x86_64-DVD-1511.iso"
	ln -f -s "CentOS-7-x86_64-DVD-1511.iso" "${D}/usr/share/${PN%-*}/centos-7-dvd-amd64.iso"
}
