# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

DESCRIPTION="pservers plugin for hosting fpemud's media library"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="net-misc/pservers"
DEPEND=""

S="${WORKDIR}"

src_install() {
        MYPATH="/usr/lib64/pservers/plugins/fpemud-medialib"
	dodir "$MYPATH"
	cp "${FILESDIR}/metadata.xml" "${D}${MYPATH}"
}
