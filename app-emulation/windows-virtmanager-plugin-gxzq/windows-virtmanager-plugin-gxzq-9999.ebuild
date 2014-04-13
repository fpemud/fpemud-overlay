# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="GuoXinZhengQuan Network Trading System plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-gxzq.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/new_gxzq_v6_38.exe
         ftp://fpemud-workstation/distfiles-private/new_gxzq_big5.exe"
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
		cp "${DISTDIR}/${f}" "${D}/opt/windows-virtmanager/plugins/gxzq"
	done
}

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/gxzq" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/gxzq"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

