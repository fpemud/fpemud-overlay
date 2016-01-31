# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Peanut Hull dynamic DNS"
HOMEPAGE="http://hsk.oray.com/"
SRC_URI="http://hsk.oray.com/download/download?id=7 -> ${P}.tar.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~x86-fbsd ~x86-freebsd ~x86-interix ~amd64-linux ~x86-linux"

RDEPEND="sys-apps/systemd"

S=${WORKDIR}/${P}.i386

src_install() {
	insinto /usr/lib/systemd/system
	doins ${FILESDIR}/phddns.service

        exeinto /usr/sbin
        doexe phddns

	dodoc readme
}

pkg_postinst() {
    elog "You will need to run phddns once to config your Oray account!!"
}
