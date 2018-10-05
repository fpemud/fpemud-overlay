# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit multilib-minimal meson

DESCRIPTION="Intrusive Red-Black Tree Collection"
HOMEPAGE="https://c-util.github.io/c-rbtree"
SRC_URI="https://github.com/c-util/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="Apache"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="virtual/pkgconfig[${MULTILIB_USEDEP}]"

