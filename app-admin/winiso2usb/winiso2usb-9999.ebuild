# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"
inherit eutils

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="http://github.com/fpemud/winiso2usb.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="Create USB boot disk from Microsoft Windows Setup CD/DVD image"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

DEPEND=""
RDEPEND=">=app-shells/bash-4.2
         app-arch/p7zip
         virtual/cdrtools
         sys-fs/ntfs3g
         >=sys-boot/grub-2.00"

#src_prepare() {
#	return
#}

src_install() {
	dobin "winiso2usb"
}
