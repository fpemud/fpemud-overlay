# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

EGIT_REPO_URI="http://github.com/jmattsson/fuseloop"
SRC_URI=""
KEYWORDS="-* amd64 x86"
DESCRIPTION="Loopback mount utility using FUSE"
LICENSE="unknown"
SLOT="0"
IUSE=""

RDEPEND="sys-fs/fuse"
DEPEND="${RDEPEND}"

src_install() {
	insinto /usr/bin
	dobin fuseloop
}
