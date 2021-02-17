# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-r3

DESCRIPTION="Tool to store the metadata of files,directories,links in a file tree"
HOMEPAGE="http://david.hardeman.nu/software.php"
#EGIT_REPO_URI="git://git.hardeman.nu/metastore.git"
EGIT_REPO_URI="https://github.com/przemoc/metastore"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="*"
IUSE=""

src_install() {
	emake DESTDIR="${D}" install || die "make install failed"
	dodoc README || die "docs install failed"
}
