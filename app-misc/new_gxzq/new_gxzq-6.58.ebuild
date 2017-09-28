# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION=""
SRC_URI="http://www.guosen.com.cn/guosen/nettrade/soft/new_gxzq_v6_58.exe"
HOMEPAGE="http://www.guosen.com.cn"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="dev-python/pefile
        sys-apps/file[python]"
RDEPEND="|| ( app-emulation/wine[linguas_zh_CN]
              app-emulation/wine[linguas_zh_CN]
              app-emulation/wine[linguas_zh_CN] )
         virtual/wine[abi_x86_32]
         >=app-emulation/winetricks-744"

S=${WORKDIR}

src_unpack() {
        mkdir "${WORKDIR}/${PN}_v${PV}"
        "${FILESDIR}/extract.py" "${DISTDIR}/${A}" "${WORKDIR}/${PN}_v${PV}"
}

src_prepare() {
        # Prepare the wrapper script
        sed -e "s/^INSTDIR=.*$/INSTDIR=\/opt\/${PN}/g" \
            -e "s/^PROGDIR=.*$/PROGDIR=\/opt\/${PN}\/${PN}_v${PV}/g" \
            -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "opt/${PN}"
        cp -r "${PN}_v${PV}" "${D}/opt/${PN}"

        dodir "opt/${PN}/fonts"
	touch "${D}/opt/${PN}/fonts/.keep"

        dobin "${PN}"

        doicon "${FILESDIR}/tdxw.png"
        domenu "${FILESDIR}/tdxw.desktop"
        doicon "${FILESDIR}/WinWT.png"
        domenu "${FILESDIR}/WinWT.desktop"
}
