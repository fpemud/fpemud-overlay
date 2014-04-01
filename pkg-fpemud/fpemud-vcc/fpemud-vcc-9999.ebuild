# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/fpemud/fpemud-vcc.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="version control system for fpemud's nexus configuration file storage"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-p2p/selfnetd
         dev-vcs/git
         dev-python/pyinotify"
DEPEND="${RDEPEND}"

pkg_postrm() {
	find "${EROOT}/usr/bin/fpemud-vcc" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/bin/fpemud-vcc"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

