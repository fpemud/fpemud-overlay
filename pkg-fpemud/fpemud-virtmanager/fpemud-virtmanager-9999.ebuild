# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/fpemud/fpemud-virtmanager.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="A simple virtual machine manager"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND=""
DEPEND="app-emulation/qemu
        app-emulation/lxc
        sys-apps/usermode-utilities
        net-dns/dnsmasq
        dev-python/lockfile"

pkg_postrm() {  
	find "${EROOT}/usr/share/fpemud-virtmanager" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/share/fpemud-virtmanager"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

