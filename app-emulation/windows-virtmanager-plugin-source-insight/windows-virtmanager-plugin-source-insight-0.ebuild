# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-r3

DESCRIPTION="Source Insight plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-source-insight.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/source-insight-setup.exe
         ftp://fpemud-workstation/distfiles-private/source-insight-CLF.zip"
LICENSE="unknown"
KEYWORDS="amd64 x86"
SLOT="0"
IUSE=""
RESTRICT="mirror"

RDEPEND="app-emulation/windows-virtmanager"
DEPEND="app-arch/unzip"

EGIT_NOUNPACK=1

src_install() {
	default

	cp "${DISTDIR}/source-insight-setup.exe" "${D}/opt/windows-virtmanager/plugins/source-insight"
	unzip "${DISTDIR}/source-insight-CLF.zip" -d "${D}/opt/windows-virtmanager/plugins/source-insight/languages"
}

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/source-insight" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/source-insight"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

