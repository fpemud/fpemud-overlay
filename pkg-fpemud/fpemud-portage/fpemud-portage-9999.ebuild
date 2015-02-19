# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="http://github.com/fpemud/fpemud-portage.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="Portage scripts for fpemud system"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-portage/mirrorselect
         app-portage/cpuinfo2cpuflags-x86
         net-misc/wget
         sys-fs/squashfs-tools
         sys-apps/portage
         sys-apps/systemd
         dev-vcs/git
         dev-vcs/subversion
         dev-vcs/mercurial
         dev-vcs/bzr
         dev-vcs/cvs"
DEPEND="${RDEPEND}"

pkg_postrm() {
	find "${EROOT}/usr/bin/fpemud-portage" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/bin/fpemud-portage"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

