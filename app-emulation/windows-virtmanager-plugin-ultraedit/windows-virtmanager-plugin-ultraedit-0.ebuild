# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-r3

DESCRIPTION="UltraEdit plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-ultraedit.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/ue_english.exe
         ftp://fpemud-workstation/distfiles-private/ue_french.exe
         ftp://fpemud-workstation/distfiles-private/ue_chinese.exe
         ftp://fpemud-workstation/distfiles-private/ue_chinese_traditional.exe
         ftp://fpemud-workstation/distfiles-private/ue_german.exe
         ftp://fpemud-workstation/distfiles-private/ue_italian.exe
         ftp://fpemud-workstation/distfiles-private/ue_japanese.exe
         ftp://fpemud-workstation/distfiles-private/ue_korean.exe
         ftp://fpemud-workstation/distfiles-private/ue_spanish.exe"
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
		cp "${DISTDIR}/${f}" "${D}/opt/windows-virtmanager/plugins/ultraedit"
	done
}

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/ultraedit" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/ultraedit"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

