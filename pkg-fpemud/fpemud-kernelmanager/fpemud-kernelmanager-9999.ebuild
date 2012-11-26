# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/fpemud/fpemud-kernelmanager.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="Build boot environment(kernel/initrd/bootloader/...) for fpemud's systems"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sys-kernel/gentoo-sources
         >=sys-kernel/dracut-019
         sys-apps/diffutils
         dev-python/kconfiglib"
DEPEND="${RDEPEND}"
