# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Manager for Microsoft Windows virtual machine"
SRC_URI=""
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager.git"
LICENSE="unknown"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""

RDEPEND="app-emulation/qemu
         app-emulation/virt-service
         net-misc/spice-gtk
         sys-fs/fuseloop
         app-misc/hivex
         sys-fs/dosfstools
         sys-fs/mtools
         sys-process/procps
         sys-process/psmisc
         app-arch/unzip"
DEPEND=""

pkg_postrm() {  
	find "${EROOT}/usr/lib/windows-virtmanager" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

