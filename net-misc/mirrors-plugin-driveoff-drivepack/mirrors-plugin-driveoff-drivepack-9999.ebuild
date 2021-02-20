# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

EGIT_REPO_URI="https://github.com/mirrorshq/mirrors-plugin-driveoff-drivepack.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/mirrors[mirrors_advertiser_ftp,mirrors_advertiser_httpdir]
         app-arch/p7zip
         sys-apps/file[python]"
DEPEND=""

pkg_extra_files() {
	echo "/var/lib/mirrors/driveoff-drivepack/***"
	echo "/var/cache/mirrors/driveoff-drivepack/***"
	echo "/var/log/mirrors/mirror-site-driveoff-drivepack/***"
}
