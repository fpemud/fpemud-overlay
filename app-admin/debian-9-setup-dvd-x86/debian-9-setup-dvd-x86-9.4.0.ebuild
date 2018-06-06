# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Debian 9.4 setup DVD (i386)"
HOMEPAGE="https://www.debian.org"
SRC_URI="http://debian.xfree.com.ar/debian-cd/${PV}/i386/iso-dvd/debian-${PV}-i386-DVD-1.iso
         http://debian.xfree.com.ar/debian-cd/${PV}/i386/iso-dvd/debian-${PV}-i386-DVD-2.iso
         http://debian.xfree.com.ar/debian-cd/${PV}/i386/iso-dvd/debian-${PV}-i386-DVD-3.iso"

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
	for i in {1..3} ; do
		doins "${DISTDIR}/debian-${PV}-i386-DVD-${i}.iso"
		ln -f -s "debian-${PV}-i386-DVD-${i}.iso" "${D}/usr/share/${PN%-*}/debian-9-i386-DVD-${i}.iso"
	done
}
