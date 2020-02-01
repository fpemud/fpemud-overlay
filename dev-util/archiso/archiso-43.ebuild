# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="Tools for creating Arch Linux live and install iso images"
HOMEPAGE="https://projects.archlinux.org/archiso.git/"
SRC_URI="https://projects.archlinux.org/${PN}.git/snapshot/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
         dev-util/arch-install-scripts
         sys-fs/dosfstools
         dev-libs/libisoburn
         sys-fs/squashfs-tools"
#        www-client/lynx

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}

