# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="RyanVM's Windows XP Post-SP3 Update Pack (x86)"
HOMEPAGE="http://www.ryanvm.net/msfn/updatepack-sp3.html"
SRC_URI="http://ryanvm.digitalschema.net/files/RVMUpdatePackSP3_${PV}.7z"

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
	doins "${DISTDIR}/RVMUpdatePackSP3_${PV}.7z"
	ln -f -s "rvm-winxp-post-sp3-update-pack.7z" "${D}/usr/share/${PN%-*}/RVMUpdatePackSP3_${PV}.7z"
}
