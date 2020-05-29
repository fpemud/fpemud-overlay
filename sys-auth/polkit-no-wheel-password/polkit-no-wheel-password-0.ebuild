# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

DESCRIPTION="PolicyKit rule: no password for wheel group"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

DEPEND=""
RDEPEND="sys-auth/polkit"

S=${WORKDIR}

src_install() {
	dodir "/etc/polkit-1"
	cp "${FILESDIR}/49-no-wheel-group-password.rules" "${D}/etc/polkit-1"
}
