# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils gnome2-utils games

DESCRIPTION="Total Annihilation"
HOMEPAGE=""
SRC_URI="http://fpemud-distfiles.local/pub/${PN}
         http://fpemud-distfiles.local/pub/${PN}.desktop
         http://fpemud-distfiles.local/pub/${PN}_16x16x4.png
         http://fpemud-distfiles.local/pub/${PN}_32x32x4.png
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD1.ccd
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD1.img
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD1.sub
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD1.iso
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD2.ccd
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD2.img
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD2.sub
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD2.iso
         http://fpemud-distfiles.local/pub/Total.Annihilation.The.Core.Contingency.iso
         http://fpemud-distfiles.local/pub/Total.Annihilation.Battle.Tactics.iso
         http://fpemud-distfiles.local/pub/ta1x-31c.zip
         http://fpemud-distfiles.local/pub/Cavedog_units.ufo
         http://fpemud-distfiles.local/pub/Total.Annihilation.CD1.zip
         http://fpemud-distfiles.local/pub/installed-ta.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="core-contingency battle-tactics tae"
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

src_unpack() {

#	7z x "${DISTDIR}/Total.Annihilation.CD1.iso" -o"${WORKDIR}/ta_cd1"
	unzip "${DISTDIR}/Total.Annihilation.CD1.zip" -d "${WORKDIR}/ta_cd1"		# cd1.iso can't be decompressed by p7zip

	7z x "${DISTDIR}/Total.Annihilation.CD2.iso" -o"${WORKDIR}/ta_cd2"
	7z x "${DISTDIR}/Total.Annihilation.The.Core.Contingency.iso" -o"${WORKDIR}/ta_cd3"
	7z x "${DISTDIR}/Total.Annihilation.Battle.Tactics.iso" -o"${WORKDIR}/ta_cd4"

	unzip "${DISTDIR}/ta1x-31c.zip" -d "${WORKDIR}/ta1x-31c"

	# Restruct the directory.
	mkdir -v "${WORKDIR}/TOTALA"

	# Should be extracted from the ZRB files in ta_cd1, but we don't know the ZRB file format
	unzip "${DISTDIR}/installed-ta.zip" -d "${WORKDIR}/installed-ta"
	mv -vf "${WORKDIR}/installed-ta"/* "${WORKDIR}/TOTALA"
	rm -rf "${WORKDIR}/installed-ta"

	mv -vf "${WORKDIR}/ta1x-31c"/* "${WORKDIR}/TOTALA"
	mv -vf "${WORKDIR}/ta_cd1/totala3.hpi" "${WORKDIR}/TOTALA"
	mv -vf "${WORKDIR}/ta_cd2/totala4.hpi" "${WORKDIR}/TOTALA"

	if use core-contingency ; then
		for f in "${WORKDIR}/ta_cd3/CC"/* ; do                   # move ta_cd3/CC/* ignoring filename case
			lwrf=`echo "$(basename $f)" | tr '[:upper:]' '[:lower:]'`
			if [ "$lwrf" == "totala.exe" ] ; then
				lwrf="TotalA.exe"
			fi
			mv -vf "$f" "${WORKDIR}/TOTALA/${lwrf}"
		done
	fi

	if use tae ; then
		mv -vf "${WORKDIR}/ta_cd3/TAE/Bitmaps" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/camps" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/TAE.EXE" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/TAE.HLP" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/TAEREAD.DOC" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/TAEREAD.TXT" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/Example.tdf" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/Example.ufo" "${WORKDIR}/TOTALA"
		mv -vf "${WORKDIR}/ta_cd3/TAE/worlds.hpi" "${WORKDIR}/TOTALA"
	fi

	if use battle-tactics ; then
		mv -vf "${WORKDIR}/ta_cd4/bt"/* "${WORKDIR}/TOTALA"
	fi

	rm -rf "${WORKDIR}/ta1x-31c"
	rm -rf "${WORKDIR}/ta_cd4"
	rm -rf "${WORKDIR}/ta_cd3"
	rm -rf "${WORKDIR}/ta_cd2"
	rm -rf "${WORKDIR}/ta_cd1"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "TOTALA" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"

        local res
        for res in 16 32; do
                newicon -s ${res} "${DISTDIR}/${PN}_${res}x${res}x4.png" "${PN}.png"
        done

	domenu "${DISTDIR}/${PN}.desktop"

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

pkg_extra_files() {
	echo "~/.local/share/total-annihilation/***"
}
