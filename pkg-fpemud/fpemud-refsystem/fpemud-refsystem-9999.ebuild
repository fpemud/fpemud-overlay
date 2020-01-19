# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

inherit git-r3

DESCRIPTION="Fpemud Reference System"
SRC_URI=""
EGIT_REPO_URI="https://coding.net/fpemud/fpemud-refsystem"

KEYWORDS="x86 amd64"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sys-apps/systemd
         app-admin/gentoo-bashrc
         app-portage/gentoolkit
         net-misc/stunnel
         net-misc/wget
         sys-apps/portage
         dev-libs/c-list
         dev-libs/c-dynbuf
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
         sys-apps/dmidecode
         app-arch/cpio
         app-arch/xz-utils
         app-arch/zip
         sys-devel/bc
         sys-libs/tdb
         dev-python/crcmod
         dev-python/lxml
         dev-python/passlib
         dev-python/ntplib
         dev-python/pygobject
         dev-python/pylkc
         dev-python/pyopenssl
         dev-python/pyudev
         dev-python/strict_pgs
         dev-python/pyparted
         dev-python/requests
         dev-perl/Digest-SHA1
         dev-perl/Proc-ProcessTable"
DEPEND="${RDEPEND}
        virtual/pkgconfig"

