# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit multilib-minimal meson

DESCRIPTION="Dynamic Buffer Implementation in Standard ISO-C11"
HOMEPAGE="https://github.com/fpemud/c-dynbuf"
SRC_URI="https://github.com/fpemud/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE=""

RDEPEND=""
DEPEND="virtual/pkgconfig[${MULTILIB_USEDEP}]"
