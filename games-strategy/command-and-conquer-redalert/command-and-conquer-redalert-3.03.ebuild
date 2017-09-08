# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Command & Conquer - Redalert"
HOMEPAGE="http://www.commandandconquer.com/en/games/bygameid/ra"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/Command.And.Conquer.Red.Alert.CD1.iso
         ftp://fpemud-workstation/distfiles-private/Command.And.Conquer.Red.Alert.CD2.iso
         ftp://fpemud-workstation/distfiles-private/Command.And.Conquer.Red.Alert.Counterstrike.ccd
         ftp://fpemud-workstation/distfiles-private/Command.And.Conquer.Red.Alert.Counterstrike.img
         ftp://fpemud-workstation/distfiles-private/Command.And.Conquer.Red.Alert.Counterstrike.sub
         ftp://fpemud-workstation/distfiles-private/Command.And.Conquer.Red.Alert.The.Aftermath.iso
         ftp://fpemud-workstation/distfiles-private/${PN}_patch_antvqa.zip
         ftp://fpemud-workstation/distfiles-private/${PN}_patch_TLF.zip
         ftp://fpemud-workstation/distfiles-private/ra303eng.zip
         ftp://fpemud-workstation/distfiles-private/ra303fra.zip
         ftp://fpemud-workstation/distfiles-private/ra303ger.zip
         ftp://fpemud-workstation/distfiles-private/${PN}_main.reg
         ftp://fpemud-workstation/distfiles-private/${PN}_counterstrike.reg
         ftp://fpemud-workstation/distfiles-private/${PN}_aftermath.reg"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="counterstrike aftermath"
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]
         sys-process/schedtool"

src_unpack() {

	7z x "${DISTDIR}/Command.And.Conquer.Red.Alert.CD1.iso" -o"${WORKDIR}/ra_cd1"

	unzip "${DISTDIR}/ra303eng.zip" -d "${WORKDIR}/ra303eng"
	mv -f "${WORKDIR}/ra303eng/_RA95.LCF" "${WORKDIR}/ra303eng/RA95.LCF"
	rm "${WORKDIR}/ra303eng/uninst.exe"
	rm "${WORKDIR}/ra303eng/UNINSTAP.EXE"
	rm "${WORKDIR}/ra303eng/RAUNINST.EXE"

	unzip "${DISTDIR}/${PN}_patch_antvqa.zip" -d "${WORKDIR}/patch-antvqa"
	unzip "${DISTDIR}/${PN}_patch_TLF.zip" -d "${WORKDIR}/patch-TLF"

	# Restruct the directory.
	mkdir -v "${WORKDIR}/default-config"
	mkdir -v "${WORKDIR}/Redalert"

	mv -vf "${WORKDIR}/ra_cd1/INSTALL/REDALERT.INI" "${WORKDIR}/default-config"

	mv -vf "${WORKDIR}/ra_cd1/INSTALL"/* "${WORKDIR}/Redalert"

	for f in "${WORKDIR}/ra303eng"/* ; do			# move ra303eng/* ignoring filename case
		for f2 in "${WORKDIR}/Redalert"/* ; do
			uprf=`echo "$(basename $f)" | tr '[:lower:]' '[:upper:]'` 
			uprf2=`echo "$(basename $f2)" | tr '[:lower:]' '[:upper:]'` 
			if [ "$uprf" == "$uprf2" ] ; then
				rm "$f2"
			fi
		done
		mv -vf "$f" "${WORKDIR}/Redalert"
	done

	mv -vf "${WORKDIR}/patch-antvqa"/* "${WORKDIR}/Redalert"

	rm -rf "${WORKDIR}/ra_cd1"
	rm -rf "${WORKDIR}/ra303eng"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "default-config" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dodir "${GAMES_PREFIX_OPT}/${PN}/registry-patch"
	cp -r "${DISTDIR}/${PN}_main.reg" "${D}/${GAMES_PREFIX_OPT}/${PN}/registry-patch/10-main.reg"
	if use counterstrike ; then
		cp -r "${DISTDIR}/${PN}_counterstrike.reg" "${D}/${GAMES_PREFIX_OPT}/${PN}/registry-patch/20-counterstrike.reg"
	fi
	if use aftermath ; then
		cp -r "${DISTDIR}/${PN}_aftermath.reg" "${D}/${GAMES_PREFIX_OPT}/${PN}/registry-patch/30-aftermath.reg"
	fi

	cp -r "Redalert" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
	#doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
