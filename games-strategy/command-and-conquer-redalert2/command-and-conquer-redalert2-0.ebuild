# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION="Command & Conquer - Redalert 2 with YURI's Revenge"
HOMEPAGE=""
SRC_URI="http://fpemud-distfiles.local/pub/${PN}
         http://fpemud-distfiles.local/pub/${PN}.desktop
         http://fpemud-distfiles.local/pub/${PN}_16x16x8.png
         http://fpemud-distfiles.local/pub/${PN}_32x32x8.png
         http://fpemud-distfiles.local/pub/${PN}-yuri
         http://fpemud-distfiles.local/pub/${PN}-yuri.desktop
         http://fpemud-distfiles.local/pub/${PN}-yuri_16x16x8.png
         http://fpemud-distfiles.local/pub/${PN}-yuri_32x32x8.png
         http://fpemud-distfiles.local/pub/RA2_YURI.zip
         http://fpemud-distfiles.local/pub/RA2_YURI-language-pack-zh_TW.zip
         http://fpemud-distfiles.local/pub/RA2_YURI-default-config.zip
         http://fpemud-distfiles.local/pub/RA2_YURI-extra-icon.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="virtual/wine[abi_x86_32]"

LANGS="zh_TW"
for X in ${LANGS};
	do IUSE="${IUSE} linguas_${X}"
done

src_unpack() {
	strip-linguas ${LANGS}

	unzip "${DISTDIR}/RA2_YURI.zip" -d "${WORKDIR}"
	unzip "${DISTDIR}/RA2_YURI-default-config.zip" -d "${WORKDIR}"
	unzip "${DISTDIR}/RA2_YURI-extra-icon.zip" -d "${WORKDIR}"
	for f in ${LINGUAS}; do
		unzip "${DISTDIR}/RA2_YURI-language-pack-${f}.zip" -d "${WORKDIR}"
	done

	mv "${WORKDIR}/opt/RedAlert2"/* .
	rm -rf "${WORKDIR}/opt/RedAlert2"
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${DISTDIR}/${PN}-yuri" > "${WORKDIR}/${PN}-yuri"
}

src_install() {

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "default-config" "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r "extra-icon"     "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r "language-pack"  "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Ra2"            "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	dogamesbin "${PN}-yuri"

	local res
	for res in 16 32; do
		newicon -s ${res} "${DISTDIR}/${PN}_${res}x${res}x8.png" "${PN}.png"
		newicon -s ${res} "${DISTDIR}/${PN}-yuri_${res}x${res}x8.png" "${PN}-yuri.png"
	done

	domenu "${DISTDIR}/${PN}.desktop"
	domenu "${DISTDIR}/${PN}-yuri.desktop"

	prepgamesdirs
}

pkg_extra_files() {
	echo "~/.local/share/command-and-conquer-redalert2/***"
}
