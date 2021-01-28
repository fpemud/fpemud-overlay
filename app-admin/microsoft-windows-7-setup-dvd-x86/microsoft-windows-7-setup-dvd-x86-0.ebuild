# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The .iso image of Microsoft Windows 7 setup DVD (x86)"
HOMEPAGE="http://www.microsoft.com/en-us/windows"
SRC_URI="http://fpemud-distfiles.local/pub/en_windows_7_ultimate_with_sp1_x86_dvd_619077.iso
         http://fpemud-distfiles.local/pub/mu_windows_7_sp1_language_pack_x86_dvd_619716.iso"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	insinto "/usr/share/${PN%-*}"
	doins "${DISTDIR}/en_windows_7_ultimate_with_sp1_x86_dvd_619077.iso"
	doins "${DISTDIR}/mu_windows_7_sp1_language_pack_x86_dvd_619716.iso"
	ln -f -s "en_windows_7_ultimate_with_sp1_x86_dvd_619077.iso" "${D}/usr/share/${PN%-*}/windows-7-setup-x86.iso"
	ln -f -s "mu_windows_7_sp1_language_pack_x86_dvd_619716.iso" "${D}/usr/share/${PN%-*}/windows-7-languagepack-x86.iso"
}
