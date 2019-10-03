# Copyright 1999-2019 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Ubuntu 18.04.3 desktop image (AMD64)"
HOMEPAGE="https://www.ubuntu.com"
SRC_URI="http://mirror.pnl.gov/releases/18.04/ubuntu-18.04.3-desktop-amd64.iso"

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
	doins "${DISTDIR}/ubuntu-18.04.3-desktop-amd64.iso"
	ln -f -s "ubuntu-18.04.3-desktop-amd64.iso" "${D}/usr/share/${PN%-*}/ubuntu-18-desktop-amd64.iso"
}
