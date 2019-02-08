# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit versionator

MAJORV=$(get_major_version)
LASTV=$(get_version_component_range 3)
DESCRIPTION="The .iso image of CentOS 7 setup DVD (x86_64)"
HOMEPAGE="https://www.centos.org"
SRC_URI="mirror://centos/${PV}/isos/x86_64/CentOS-${MAJORV}-x86_64-DVD-${LASTV}.iso"

LICENSE="unknown"
SLOT="7.4"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	insinto "/usr/share/${PN%-*}"
	doins "${DISTDIR}/CentOS-${MAJORV}-x86_64-DVD-${LASTV}.iso"
	ln -f -s "CentOS-${MAJORV}-x86_64-DVD-${LASTV}.iso" "${D}/usr/share/${PN%-*}/centos-${MAJORV}-dvd-amd64.iso"
}
