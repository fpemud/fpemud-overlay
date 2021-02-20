# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

EGIT_REPO_URI="https://github.com/mirrorshq/mirrors-plugin-wikipedia-kiwix.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/mirrors[mirrors_advertiser_kiwix,mirrors_advertiser_httpdir,mirrors_advertiser_ftp,mirrors_advertiser_rsync]
         dev-python/atomicwrites
         dev-python/pysvn
         net-misc/aria2"
DEPEND=""

pkg_extra_files() {
	echo "/var/lib/mirrors/wikipedia-kiwix/***"
	echo "/var/cache/mirrors/wikipedia-kiwix/***"
	echo "/var/log/mirrors/mirror-site-wikipedia-kiwix/***"
}
