# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION=""
SRC_URI="http://www.guosen.com.cn/guosen/nettrade/soft/new_gxzq_v6_56.exe"
HOMEPAGE="http://www.guosen.com.cn"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/pefile"
RDEPEND="|| ( >=app-emulation/wine-1.4.1[win32]
              >=app-emulation/wine-1.6[abi_x86_32]
              >=app-emulation/wine-1.8[abi_x86_32] )"

src_unpack() {
        python2 ${FILESDIR}/extract-rsrc.py ${A} tmp.dat
}

src_prepare() {
        return
}

src_install() {
        return
}
