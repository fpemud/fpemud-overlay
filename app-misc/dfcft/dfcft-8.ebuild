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

DEPEND="app-arch/p7zip
        || ( app-admin/microsoft-windows-xp-setup-cd-x86
             app-admin/microsoft-windows-7-setup-dvd-x86
             app-admin/microsoft-windows-7-setup-dvd-amd64 )"
RDEPEND="|| ( >=app-emulation/wine-1.4.1[win32]
              >=app-emulation/wine-1.6[abi_x86_32]
              >=app-emulation/wine-1.8[abi_x86_32] )"

src_unpack() {
	mkdir "${WORKDIR}/${P}/data"
	7z x "${DISTDIR}/${A}" -o"${WORKDIR}/${P}/data"

	# Restruct the directory.
	rm -rf "${WORKDIR}/${P}/data/\$PLUGINSDIR"
	rm "${WORKDIR}/${P}/data/uninst.exe.nsis"

	# Get simsun font
	mkdir "${WORKDIR}/${P}/fonts"
	if [ -e /usr/share/microsoft-windows-7-setup-dvd/windows-7-setup-x86.iso ] ; then
		7z e /usr/share/microsoft-windows-7-setup-dvd/windows-7-setup-x86.iso sources/install.wim -o"${WORKDIR}/${P}/fonts"
		7z e "${WORKDIR}/${P}/fonts/install.wim" 1/Windows/Fonts/simsun.ttc -o"${WORKDIR}/${P}/fonts"
		7z e "${WORKDIR}/${P}/fonts/install.wim" 1/Windows/Fonts/simsunb.ttf -o"${WORKDIR}/${P}/fonts"
		rm "${WORKDIR}/${P}/fonts/install.wim"
	else
		die "No Microsoft Windows setup ISO file found"
	fi
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^OPTDIR=.*$/OPTDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${P}/${PN}"
}

src_install() {
	dodir "opt/${PN}/swc8"
	cp -r data/* "${D}/opt/${PN}/swc8"
	find "${D}/opt/${PN}/swc8" -type d | xargs chmod 755

	dodir "opt/${PN}/fonts"
	cp -r fonts/* "${D}/opt/${PN}/fonts"

	dobin "${PN}"
	#doicon "${DISTDIR}/${PN}.png"
	#domenu "${DISTDIR}/${PN}.desktop"
}
