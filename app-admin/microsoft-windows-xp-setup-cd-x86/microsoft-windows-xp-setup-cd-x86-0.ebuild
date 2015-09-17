# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The .iso image of Microsoft Windows XP setup CD (x86)"
HOMEPAGE="http://www.microsoft.com/en-us/windows"
SRC_URI="ftp://fpemud-workstation/distfiles-private/en_windows_xp_professional_with_service_pack_3_x86_cd_vl_x14-73974.iso
         ftp://fpemud-workstation/distfiles-private/mu_windows_xp_language_pack.iso"

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
	doins "${DISTDIR}/en_windows_xp_professional_with_service_pack_3_x86_cd_vl_x14-73974.iso"
	doins "${DISTDIR}/mu_windows_xp_language_pack.iso"
	ln -f -s "en_windows_xp_professional_with_service_pack_3_x86_cd_vl_x14-73974.iso" "${D}/usr/share/${PN%-*}/windows-xp-setup-x86.iso"
	ln -f -s "mu_windows_xp_language_pack.iso"                                        "${D}/usr/share/${PN%-*}/windows-xp-languagepack-x86.iso"
}
