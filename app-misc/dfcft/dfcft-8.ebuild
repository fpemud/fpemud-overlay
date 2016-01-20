# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="EastMoney"
SRC_URI="http://stattg.eastmoney.com/10078 -> dfcft.exe"
HOMEPAGE="http://www.eastmoney.com"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/p7zip"
RDEPEND="|| ( >=app-emulation/wine-1.4.1[win32]
              >=app-emulation/wine-1.6[abi_x86_32]
              >=app-emulation/wine-1.8[abi_x86_32] )"

src_unpack() {
	mkdir "${WORKDIR}/${P}"
	7z x "${DISTDIR}/${A}" -o"${WORKDIR}/${P}"

	# Restruct the directory.
	rm -rf "${WORKDIR}/${P}/\$PLUGINSDIR"
	rm "${WORKDIR}/${P}/uninst.exe.nsis"
}

#src_prepare() {
	# Prepare the wrapper script
#	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/limbo/g" \
#	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/limbo/g" "${FILESDIR}/limbo" > "${WORKDIR}/limbo"
#}

src_install() {
	dodir "opt/${PN}/swc8"
	cp -r * "${D}/opt/${PN}/swc8"
}
