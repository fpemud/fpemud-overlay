# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Ubuntu 17.10 server install image (AMD64)"
HOMEPAGE="https://www.ubuntu.com"
SRC_URI="http://mirror.pnl.gov/releases/17.10/ubuntu-17.10-server-amd64.iso"

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
	doins "${DISTDIR}/ubuntu-17.10-server-amd64.iso"
	ln -f -s "ubuntu-17.10-server-amd64.iso" "${D}/usr/share/${PN%-*}/ubuntu-17-server-amd64.iso"
}
