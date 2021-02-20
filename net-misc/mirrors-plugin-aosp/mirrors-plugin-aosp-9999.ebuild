# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

EGIT_REPO_URI="https://github.com/mirrorshq/mirrors-plugin-aosp.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/mirrors[mirrors_advertiser_git,mirrors_advertiser_klaus]
         dev-vcs/repo"
DEPEND=""

pkg_extra_files() {
	echo "/var/lib/mirrors/aosp/***"
	echo "/var/cache/mirrors/aosp/***"
	echo "/var/log/mirrors/mirror-site-aosp/***"
}
