# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit versionator

MAJORV=$(get_major_version)
LASTV=$(get_version_component_range 3)
DESCRIPTION="The .iso image of deepin setup DVD"
HOMEPAGE="https://www.deepin.org"
SRC_URI="http://cdimage.deepin.com/releases/${PV}/deepin-${PV}-amd64.iso"

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
	doins "${DISTDIR}/deepin-${PV}-amd64.iso"
	ln -f -s "deepin-${PV}-amd64.iso" "${D}/usr/share/${PN%-*}/deepin-linux-amd64.iso"
}
