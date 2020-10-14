# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The .iso image of Microsoft Windows 10 setup DVD (x64)"
HOMEPAGE="http://www.microsoft.com/en-us/windows"
SRC_URI="ftp://fpemud-distfiles.local/en_windows_10_x64_preview.iso"

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
	doins "${DISTDIR}/en_windows_10_x64_preview.iso"
	ln -f -s "en_windows_10_x64_preview.iso" "${D}/usr/share/${PN%-*}/windows-10-setup-amd64.iso"
}
