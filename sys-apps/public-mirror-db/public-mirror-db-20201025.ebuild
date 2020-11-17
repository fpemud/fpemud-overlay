# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Database of information about public mirrors"
HOMEPAGE="https://github.com/mirrorshq/public-mirror-db"
#SRC_URI="https://releases.pagure.org/libosinfo/${P}.tar.xz"
EGIT_REPO_URI="https://github.com/mirrorshq/public-mirror-db.git"

LICENSE="GPL-3"
SLOT="0"

KEYWORDS="~alpha amd64 ~arm arm64 ~ia64 ~ppc ~ppc64 ~sparc x86"

RDEPEND=""
DEPEND=""

src_install() {
	dodir "/usr/share/${PN}"
	cp -r mirrors-* "${D}/usr/share/${PN}"
	cp -r schema "${D}/usr/share/${PN}"
}
