# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="A general purpose library for the OpenWRT project."
HOMEPAGE="http://wiki.openwrt.org/"
EGIT_REPO_URI="https://git.openwrt.org/project/${PN}.git"
LICENSE="GPLv2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

#DEPEND="
#	dev-libs/libubox
#"

#src_compile() {
#	emake LDFLAGS="${LDFLAGS} -L/usr/lib64"
#}
