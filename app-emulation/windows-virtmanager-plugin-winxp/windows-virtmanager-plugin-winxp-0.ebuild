# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Microsoft Windows XP plugin for windows-virtmanager"
EGIT_REPO_URI="git://fpemud-workstation/windows-virtmanager-plugin-winxp.git"
SRC_URI="ftp://fpemud-workstation/distfiles-private/winxp_sp3.iso
         ftp://fpemud-workstation/distfiles-private/WindowsXP-KB942288-v3-x86.exe
         ftp://fpemud-workstation/distfiles-private/IE8-WindowsXP-x86-CHS.exe
         ftp://fpemud-workstation/distfiles-private/wmp11-windowsxp-x86-ZH-CN.exe
         ftp://fpemud-workstation/distfiles-private/jre-7u17-windows-i586.exe
         ftp://fpemud-workstation/distfiles-private/jre-7u17-windows-x64.exe
         ftp://fpemud-workstation/distfiles-private/install_flash_player.exe
         ftp://fpemud-workstation/distfiles-private/install_flash_player_ax.exe
         ftp://fpemud-workstation/distfiles-private/virtio-win-0.1-52.iso
         ftp://fpemud-workstation/distfiles-private/vdagent-win32_20111124.zip
         ftp://fpemud-workstation/distfiles-private/qxl_xp_x86.zip"
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
		cp "${DISTDIR}/${f}" "${D}/opt/windows-virtmanager/plugins/winxp"
	done
}

pkg_postrm() {
	find "${EROOT}/usr/lib/windows-virtmanager/plugins/winxp" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/windows-virtmanager/plugins/winxp"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}

