# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Tencent QQ Game plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-qq-game.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/QQGame2013Beta2P1_setup_web.exe"
LICENSE="unknown"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/windows-virtmanager"
DEPEND=""

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/qq-game" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/qq-game"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

