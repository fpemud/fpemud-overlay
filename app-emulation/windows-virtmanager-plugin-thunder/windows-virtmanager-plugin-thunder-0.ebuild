# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Thunder plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-thunder.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/Thunder_7.9.2.4380VIP.exe
         ftp://fpemud-workstation/distfiles-private/Thunder7.9.7.4524.zip"
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
		cp "${DISTDIR}/${f}" "${D}/opt/windows-virtmanager/plugins/thunder"
	done
}

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/thunder" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/thunder"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

