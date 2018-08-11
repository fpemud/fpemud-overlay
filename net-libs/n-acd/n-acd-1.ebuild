# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit multilib-minimal meson

DESCRIPTION="IPv4 Address Conflict Detection"
HOMEPAGE="https://github.com/nettools/n-acd"
SRC_URI="https://github.com/nettools/${PN}/releases/download/v${PV}/${P}.tar.xz"

LICENSE="LGPL-2.1+"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="virtual/pkgconfig[${MULTILIB_USEDEP}]"

