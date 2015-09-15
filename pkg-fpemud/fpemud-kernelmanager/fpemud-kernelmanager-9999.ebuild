# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Build boot stack(kernel/initramfs/bootloader/...) for fpemud's systems"
SRC_URI=""
EGIT_REPO_URI="http://github.com/fpemud/fpemud-kernelmanager.git"

KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="sys-boot/grub:2[grub_platforms_pc,grub_platforms_efi-64]
         sys-boot/efibootmgr
         sys-boot/os-prober
         sys-fs/lvm2
         sys-fs/reiserfsprogs
         sys-fs/xfsprogs
         sys-fs/ntfs3g
         sys-apps/kmod[python]
         sys-apps/diffutils
         sys-apps/systemd
         app-arch/cpio
         app-arch/xz-utils
         dev-vcs/git
         dev-python/lxml
         dev-python/pylkc
         dev-python/pyudev
         dev-python/libebuild2"
DEPEND="${RDEPEND}
        virtual/pkgconfig"

pkg_postrm() {
	find "${EROOT}/usr/lib/fpemud-kernelmanager" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/fpemud-kernelmanager"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}
