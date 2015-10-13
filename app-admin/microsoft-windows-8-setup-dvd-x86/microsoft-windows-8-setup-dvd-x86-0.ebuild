# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The .iso image of Microsoft Windows 8.1 setup DVD (x86)"
HOMEPAGE="http://www.microsoft.com/en-us/windows"
SRC_URI="ftp://fpemud-workstation/distfiles-private/en_windows_8.1_professional_vl_with_update_x86_dvd_4065201.iso"

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
	doins "${DISTDIR}/en_windows_8.1_professional_vl_with_update_x86_dvd_4065201.iso"
	ln -f -s "en_windows_8.1_professional_vl_with_update_x86_dvd_4065201.iso" "${D}/usr/share/${PN%-*}/windows-8-setup-x86.iso"
}
