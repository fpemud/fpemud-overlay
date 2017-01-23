# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils git-2
EGIT_REPO_URI="https://github.com/meyerd/n2n"

DESCRIPTION="A Layer-2 P2P VPN"
HOMEPAGE="http://www.ntop.org/products/n2n/"
LICENSE="GPL-3"

SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

src_unpack() {
	git-2_src_unpack
	rm -rf "${P}/n2n_v1" "${P}/README"
	mv "${P}/n2n_v2"/* "${P}"
	rmdir "${P}/n2n_v2"
}

src_prepare() {
        epatch "${FILESDIR}"/*.patch
}
