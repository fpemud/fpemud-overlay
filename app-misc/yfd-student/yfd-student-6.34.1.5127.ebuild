# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils

DESCRIPTION="Yan Fu Dao client for student"
HOMEPAGE="https://www.yuanfudao.com"
SRC_URI="https://planet.fbcontent.cn/apps/download/yfdstudent-${PV}-installer.exe"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {
	7z x "${DISTDIR}/yfdstudent-${PV}-installer.exe" -o"${WORKDIR}/tmp"
	rm -rf "${WORKDIR}/tmp/\$PLUGINSDIR"
	rm -f "${WORKDIR}/tmp/uninst.exe.nsis"
	7z x "${WORKDIR}/tmp/app.7z" -o"${WORKDIR}/tmp"
	rm -f "${WORKDIR}/tmp/app.7z"
}

src_prepare() {
	sed -e "s/^APPDIR=.*$/APPDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "opt/${PN}"
	cp -r tmp/* "${D}/opt/${PN}"

	dobin "${PN}"
	#doicon "${DISTDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"
}
