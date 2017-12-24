# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit versionator

MAJORV=$(get_major_version)
DESCRIPTION="The .iso images of CentOS 6 setup DVD (x86_64)"
HOMEPAGE="https://www.centos.org"
SRC_URI="mirror://centos/${PV}/isos/x86_64/CentOS-${PV}-x86_64-LiveDVD.iso
         mirror://centos/${PV}/isos/x86_64/CentOS-${PV}-x86_64-bin-DVD1.iso
         mirror://centos/${PV}/isos/x86_64/CentOS-${PV}-x86_64-bin-DVD2.iso"

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
	doins "${DISTDIR}/CentOS-${PV}-x86_64-LiveDVD.iso"
	doins "${DISTDIR}/CentOS-${PV}-x86_64-bin-DVD1.iso"
	doins "${DISTDIR}/CentOS-${PV}-x86_64-bin-DVD2.iso"
	ln -f -s "CentOS-${PV}-x86_64-LiveDVD.iso" "${D}/usr/share/${PN%-*}/centos-${MAJORV}-livedvd-amd64.iso"
	ln -f -s "CentOS-${PV}-x86_64-bin-DVD1.iso" "${D}/usr/share/${PN%-*}/centos-${MAJORV}-bindvd1-amd64.iso"
	ln -f -s "CentOS-${PV}-x86_64-bin-DVD2.iso" "${D}/usr/share/${PN%-*}/centos-${MAJORV}-bindvd2-amd64.iso"
}
