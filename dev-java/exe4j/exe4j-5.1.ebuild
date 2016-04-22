# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="Exe4j is useful if you want to create a Java launcher without an installer."
HOMEPAGE="http://www.ej-technologies.com"
SRC_URI="http://download-keycdn.ej-technologies.com/${PN}/${PN}_unix_5_1.tar.gz"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND=""

src_install() {
	dodir "opt"
	cp -r * "${D}/opt"
	dosym "/opt/${PN}/bin/exe4j" "/usr/bin/exe4j"
	dosym "/opt/${PN}/bin/exe4jc" "/usr/bin/exe4jc"
}
