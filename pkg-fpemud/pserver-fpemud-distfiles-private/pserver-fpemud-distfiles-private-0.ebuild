# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

DESCRIPTION="private server for hosting fpemud's private gentoo distfiles"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="net-misc/pservers
         net-misc/pservers-plugin-keeley"
DEPEND=""

S="${WORKDIR}"

src_install() {
        MYPATH="/usr/lib/pservers/servers"
	dodir "$MYPATH"
	cp ${FILESDIR}/* "${D}${MYPATH}"
}
