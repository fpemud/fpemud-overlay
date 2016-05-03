# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="A simple virtual machine player"
EGIT_REPO_URI="https://github.com/fpemud/lightbox.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-emulation/qemu[spice]
         net-misc/spice-gtk
         dev-python/python-qemu-qmp
         dev-python/elemlib
         app-emulation/virt-service"
DEPEND=""

pkg_postrm() {
	find "${EROOT}/usr/bin/lightbox" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/bin/lightbox"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}
