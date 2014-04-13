# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Tortoise Git plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-tortoise-git.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/TortoiseGit-1.8.3.0-32bit.msi
         ftp://fpemud-workstation/distfiles-private/TortoiseGit-1.8.3.0-64bit.msi"
LICENSE="unknown"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/windows-virtmanager"
DEPEND=""

EGIT_NOUNPACK=1

src_install() {
	default

	for f in ${A} ; do
		cp "${DISTDIR}/${f}" "${D}/opt/windows-virtmanager/plugins/tortoise-git"
	done
}

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/tortoise-git" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/tortoise-git"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

