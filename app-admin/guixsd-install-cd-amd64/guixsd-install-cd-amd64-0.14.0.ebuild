# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="The .iso image of GuixSD install CD (x86_64)"
HOMEPAGE="https://www.gnu.org/software/guix"
SRC_URI="https://alpha.gnu.org/gnu/guix/guixsd-install-${PV}.x86_64-linux.iso.xz"

LICENSE="unknown"
SLOT="0.14.0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RESTRICT="mirror"
S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	dodir "/usr/share/${PN%-*}"
	unxz "${DISTDIR}/guixsd-install-${PV}.x86_64-linux.iso.xz" --stdout > "${D}/usr/share/${PN%-*}/guixsd-install-${PV}.x86_64-linux.iso"
	ln -f -s "guixsd-install-${PV}.x86_64-linux.iso" "${D}/usr/share/${PN%-*}/${PN}.iso"
}
