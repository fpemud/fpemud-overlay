# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="Go engine with no human-provided knowledge, modeled after the AlphaGo Zero paper."
HOMEPAGE="https://lczero.org"
SRC_URI="https://github.com/LeelaChessZero/lc0/archive/v${PV}.tar.gz -> lc0-v${P}.tar.gz
         https://github.com/LeelaChessZero/lczero-common/archive/00fd892e648160c294346c87449126d9bad80a16.tar.gz -> ${P}-common.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND="sci-libs/tensorflow"

S="${WORKDIR}/lc0-${PV}"

src_unpack() {
	unpack "lc0-v${P}.tar.gz"
	cd "${S}" || die
        tar xf "${DISTDIR}/${P}-common.tar.gz" --strip-components 1 -C "./libs/lczero-common" || die "Failed to unpack ${P}-common.tar.gz"
}
