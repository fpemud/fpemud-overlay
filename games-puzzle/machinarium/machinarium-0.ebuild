# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Machinarium"
HOMEPAGE="http://machinarium.net"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}_16x16x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_32x32x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_48x48x32.png
         ftp://fpemud-workstation/distfiles-private/Machinarium.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""

DEPEND="app-arch/p7zip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]
         >=app-emulation/winetricks-744"

src_unpack() {
	7z x "${DISTDIR}/Machinarium.iso" Machinarium_Setup_EN.exe -o"${WORKDIR}"

	mkdir "${WORKDIR}/Machinarium"
	7z x "${WORKDIR}/Machinarium_Setup_EN.exe" "machinarium.exe" -o"${WORKDIR}/Machinarium"
	7z x "${WORKDIR}/Machinarium_Setup_EN.exe" "\$_OUTDIR" -o"${WORKDIR}"
	mv "${WORKDIR}/\$_OUTDIR"/* "${WORKDIR}/Machinarium"
	rmdir "${WORKDIR}/\$_OUTDIR"
	echo "[InternetShortcut]\r\nURL=http://www.machinarium.com\r\n" > "${WORKDIR}/Machinarium/Machinarium.url"

	rm -f "${WORKDIR}/Machinarium_Setup_EN.exe"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/machinarium/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/machinarium/g" "${DISTDIR}/machinarium" > "${WORKDIR}/machinarium"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/machinarium"
	cp -r "Machinarium" "${D}/${GAMES_PREFIX_OPT}/machinarium"

	dogamesbin "machinarium"

	local res
	for res in 16 32 48; do
		newicon -s ${res} "${DISTDIR}/${PN}_${res}x${res}x32.png" "${PN}.png"
	done

	domenu "${DISTDIR}/machinarium.desktop"

	prepgamesdirs
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
