# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="ActivePython plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-active-python.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/ActivePython-2.7.2.5-win32-x86.msi
         ftp://fpemud-workstation/distfiles-private/ActivePython-2.7.2.5-win64-x64.msi
         ftp://fpemud-workstation/distfiles-private/ActivePython-3.2.2.3-win32-x86.msi
         ftp://fpemud-workstation/distfiles-private/ActivePython-3.2.2.3-win64-x64.msi"
LICENSE="unknown"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/windows-virtmanager"
DEPEND=""

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/active-python" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/active-python"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

