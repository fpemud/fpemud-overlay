# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

EGIT_REPO_URI="https://github.com/syncupd/syncupd.git"
SRC_URI=""

DESCRIPTION="Offload workload to another server by synchronizing the entire system up there."
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE="zeroconf"

RDEPEND="sys-fs/e2fsprogs
         dev-python/pyopenssl"
DEPEND=""

src_prepare() {
	eapply_user
	if ! use zeroconf ; then
		sed -i -e "s/self.avahiSupport = .*/self.avahiSupport = False/g" "${WORKDIR}/${P}/lib/gbs_param.py"
	fi
}

pkg_extra_files() {
	echo "/etc/syncupd/***"
	echo "/var/cache/syncupd/***"
	echo "/var/log/syncupd/***"
}
