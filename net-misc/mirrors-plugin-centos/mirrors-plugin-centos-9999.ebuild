# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

EGIT_REPO_URI="https://github.com/mirrorshq/mirrors-plugin-centos.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/mirrors[mirrors_advertiser_httpdir,mirrors_advertiser_rsync]"
DEPEND=""

pkg_extra_files() {
	echo "/var/lib/mirrors/centos/***"
	echo "/var/cache/mirrors/centos/***"
	echo "/var/log/mirrors/mirror-site-centos/***"

	echo "/var/lib/mirrors/centos-altarch/***"
	echo "/var/cache/mirrors/centos-altarch/***"
	echo "/var/log/mirrors/mirror-site-centos-altarch/***"
}
