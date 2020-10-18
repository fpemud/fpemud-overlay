# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

#inherit meson

DESCRIPTION="AobaZero is a Shogi AI project that aims to replicate AlphaZero Shogi experiment."
HOMEPAGE="https://github.com/kobanium/aobazero"
SRC_URI="https://github.com/kobanium/aobazero/archive/v${PV}.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=""

#src_unpack() {
#	unpack "lc0-v${P}.tar.gz"
#	cd "${S}" || die
#        tar xf "${DISTDIR}/${P}-common.tar.gz" --strip-components 1 -C "./libs/lczero-common" || die "Failed to unpack ${P}-common.tar.gz"
#}
