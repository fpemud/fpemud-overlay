# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="http://github.com/fpemud/selfnetd.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="An overlay network to integrite all the systems that belongs to a single people"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/pyopenssl
         dev-python/python-daemon
         dev-python/netifaces
         dev-python/libasyncns-python
         sys-apps/systemd"
DEPEND=""

pkg_postrm() {  
	find "${EROOT}/usr/lib/selfnetd" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/selfnetd"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}
