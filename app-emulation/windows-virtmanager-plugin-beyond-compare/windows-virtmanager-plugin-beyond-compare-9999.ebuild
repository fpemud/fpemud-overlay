# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Beyond Compare plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-beyond-compare.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/BCompare-3.3.7.15876.exe
         ftp://fpemud-workstation/distfiles-private/BCompare-de-3.3.7.15876.exe
         ftp://fpemud-workstation/distfiles-private/BCompare-fr-3.3.7.15876.exe
         ftp://fpemud-workstation/distfiles-private/BCompare-jp-3.3.7.15876.exe
         ftp://fpemud-workstation/distfiles-private/BCompare-zh-3.3.7.15876.exe"
LICENSE="unknown"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/windows-virtmanager"
DEPEND=""

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/beyond-compare" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/beyond-compare"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

