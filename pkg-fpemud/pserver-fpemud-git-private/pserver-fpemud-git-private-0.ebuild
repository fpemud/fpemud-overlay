# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

DESCRIPTION="private server for hosting fpemud's git repositories"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="*"
IUSE=""

RDEPEND="net-misc/pservers
         net-misc/pservers-plugin-klaus"
DEPEND=""

S="${WORKDIR}"

src_install() {
        MYPATH="/usr/lib/pservers/servers"
	dodir "$MYPATH"
	cp ${FILESDIR}/* "${D}${MYPATH}"
}

pkg_extra_files() {
	echo "/var/lib/pservers/fpemud-git-private/***"
}
