# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

DESCRIPTION="Database of information about public mirrors"
HOMEPAGE="https://github.com/mirrorshq/public-mirror-db"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/mirrorshq/public-mirror-db.git"
else
	SRC_URI="https://github.com/mirrorshq/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
fi

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

#S=${WORKDIR}

src_install() {
	dodir "/usr/share/${PN}"
	cp -r mirrors-* "${D}/usr/share/${PN}"
	cp -r schema "${D}/usr/share/${PN}"
}
