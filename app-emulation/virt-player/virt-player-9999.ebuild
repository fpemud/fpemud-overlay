# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="http://github.com/fpemud/virt-player.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="A simple virtual machine player"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-emulation/qemu[spice]
         net-misc/spice-gtk
         dev-python/pexpect
         dev-python/python-qemu-qmp
         dev-python/elemlib
         app-emulation/virt-service"
DEPEND=""

pkg_postrm() {
	find "${EROOT}/usr/bin/virt-player" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/bin/virt-player"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}
