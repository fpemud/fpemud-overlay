# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Fpemud Reference System"
SRC_URI=""
EGIT_REPO_URI="https://coding.net/fpemud/fpemud-refsystem"

KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sys-apps/systemd
         app-admin/gentoo-bashrc
         app-portage/gentoolkit
         net-misc/stunnel
         net-misc/wget
         sys-apps/portage
         dev-util/patchutils
         dev-vcs/git
         dev-vcs/subversion
         sys-boot/grub:2[grub_platforms_pc,grub_platforms_efi-64]
         sys-boot/efibootmgr
         sys-boot/os-prober
         sys-fs/lvm2
         sys-fs/squashfs-tools
         sys-fs/reiserfsprogs
         sys-fs/xfsprogs
         sys-fs/ntfs3g
         >=sys-fs/dosfstools-4.0-r1
         sys-apps/kmod[python]
         sys-apps/diffutils
         sys-apps/smartmontools
         app-arch/cpio
         app-arch/xz-utils
         app-arch/zip
         app-misc/geoclue
         sys-devel/bc
         sys-libs/tdb
         dev-python/dbus-python
         dev-python/dirchecksum
         dev-python/lxml
         dev-python/passlib
         dev-python/ntplib
         dev-python/pylkc
         dev-python/pyudev
         dev-python/strict_pgs
         dev-python/geopy
         dev-perl/Digest-SHA1
         dev-perl/Proc-ProcessTable"
DEPEND="${RDEPEND}
        virtual/pkgconfig"
