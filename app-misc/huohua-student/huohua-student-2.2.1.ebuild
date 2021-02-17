# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="Huo Hua Si Wei client for student"
HOMEPAGE="https://www.huohua.cn"
SRC_URI="https://img.txqn.huohua.cn/online/peppa-app-pc-student-signed/%E7%81%AB%E8%8A%B1%E6%80%9D%E7%BB%B4-${PV}.exe -> ${P}.exe"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {
	7z x "${DISTDIR}/xes_live_win_v${PV}.exe" -o"${WORKDIR}/tmp"
	mv "${WORKDIR}/tmp/\$LOCALAPPDATA/Xes_Live_Client/${PV}" "${WORKDIR}/Xes_Live_Client"
	find "${WORKDIR}/Xes_Live_Client" -type d | xargs chmod 755
}

src_prepare() {
	sed -e "s/^APPDIR=.*$/APPDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "opt/${PN}"
	cp -r "Xes_Live_Client" "${D}/opt/${PN}"

	dobin "${PN}"
	#doicon "${DISTDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"
}
