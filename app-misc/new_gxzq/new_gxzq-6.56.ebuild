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

DEPEND="dev-python/pefile
        sys-apps/file[python]"
RDEPEND="|| ( >=app-emulation/wine-1.4.1[win32]
              >=app-emulation/wine-1.6[abi_x86_32]
              >=app-emulation/wine-1.8[abi_x86_32] )"

S=${WORKDIR}

src_unpack() {
        mkdir "${WORKDIR}/${PN}_v${PV}"
        "${FILESDIR}/extract.py" "${DISTDIR}/${A}" "${WORKDIR}/${PN}_v${PV}"
}

src_prepare() {
        # Prepare the wrapper script
        sed -e "s/^INSTDIR=.*$/INSTDIR=\/opt\/${PN}_v${PV}/g" \
            -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
        dodir "opt"
        cp -r "${PN}_v${PV}" "${D}/opt"

        dobin "${PN}"
        #doicon "${DISTDIR}/${PN}.png"
        #domenu "${DISTDIR}/${PN}.desktop"
}
