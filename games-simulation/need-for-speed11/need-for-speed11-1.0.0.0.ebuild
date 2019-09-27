# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games check-reqs

DESCRIPTION="Need For Speed 11 - Hot Pursuit Reloaded"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}_16x16x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_32x32x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_48x48x32.png
         ftp://fpemud-workstation/distfiles-private/${PN}_256x256x32.png
	 ftp://fpemud-workstation/distfiles-private/${PN}_en_GB.reg
	 ftp://fpemud-workstation/distfiles-private/Need.for.Speed.11.Hot.Pursuit-RELOADED.iso"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip
	app-arch/cabextract
	app-arch/p7zip"
RDEPEND="virutal/wine[abi_x86_32]"

CHECKREQS_DISK_BUILD=16G

#LANGS="cs de en_GB en_US es fr hu it nl pl ru zh_TW"
LANGS="en_GB"
for X in ${LANGS};
	do IUSE="${IUSE} linguas_${X}"
done

mkdir_and_move_files() {
	dstdir=$1
	newdir=$2
	cabdir=$3

	mkdir -p "${dstdir}/${newdir}"

	prefix=${newdir//\//}
	for fn in $(find "${cabdir}" -mindepth 1 -name "${prefix}*"); do
		bn=$(basename "${fn}")
		mv "${fn}" "${dstdir}/${newdir}/${bn#${prefix}}"
	done
}

src_unpack() {
	srcdir="${WORKDIR}/nfs11"
	cabdir="${WORKDIR}/cabdata"
	dstdir="${WORKDIR}/Need for Speed(TM) Hot Pursuit"

	# Initialization
	mkdir "${srcdir}"
	7z x "${DISTDIR}/Need.for.Speed.11.Hot.Pursuit-RELOADED.iso" -o"${srcdir}"

	mkdir "${dstdir}"

	# Extract game data files
	mkdir "${cabdir}"

	for px in "" "2" "3" "4" "5" "6"; do
		cabextract -d "${cabdir}" "${srcdir}/data${px}.cab"
		rm "${srcdir}/data${px}.cab"
	done
	for fn in $(find ${cabdir} -mindepth 1 -name "*"); do
		nfn=$(dirname "${fn}")/$(basename "${fn}" | sed -e "s/_\\([^_]\\+\\)$/.\\1/")
		mv "${fn}" "${nfn}"		# rename for example AIAIDATA_BNDL to AIAIDATA.BNDL
	done

	# Restruct game data files
	mkdir_and_move_files "${dstdir}" "AI"                  "${cabdir}"
	mkdir_and_move_files "${dstdir}" "CHARACTERS"          "${cabdir}"
	mkdir_and_move_files "${dstdir}" "ENVIRONMENTSETTINGS" "${cabdir}"
	mkdir_and_move_files "${dstdir}" "ENVIRONMENT"         "${cabdir}"
	mkdir_and_move_files "${dstdir}" "GAMELOGIC/UILISTS"   "${cabdir}"
	mkdir_and_move_files "${dstdir}" "GAMELOGIC"           "${cabdir}"
	mkdir_and_move_files "${dstdir}" "POSTFX"              "${cabdir}"
	mkdir_and_move_files "${dstdir}" "SEACREST"            "${cabdir}"
	mkdir_and_move_files "${dstdir}" "SOUND/STREAMS"       "${cabdir}"
	mkdir_and_move_files "${dstdir}" "SOUND"               "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/FONTS"            "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/GROUPS"           "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/IMAGES/CARSELECT" "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/IMAGES/UNLOCKS"   "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/IMAGES"           "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/LANGUAGE"         "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/LAYOUTS"          "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/MOVIES"           "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/SCREENS"          "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/SONGS"            "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI/STREAMS"          "${cabdir}"
	mkdir_and_move_files "${dstdir}" "UI"                  "${cabdir}"
	mkdir_and_move_files "${dstdir}" "VEHICLES"            "${cabdir}"

	for lang in DE EN_US ES FR IT JA RU; do
		mkdir_and_move_files "${dstdir}" "${lang}/FEEDBACKGROUPS" "${cabdir}"
		mkdir_and_move_files "${dstdir}" "${lang}/PB"             "${cabdir}"
		mkdir_and_move_files "${dstdir}" "${lang}"                "${cabdir}"
	done

	mv "${cabdir}"/* "${dstdir}"

	# Copy auxillary files
	mv "${srcdir}/Activation.exe"     "${dstdir}"
	mv "${srcdir}/Activation.x86.dll" "${dstdir}"
	mv "${srcdir}/Activation.xml"     "${dstdir}"
	mv "${srcdir}/ConfigTool.exe"     "${dstdir}"
	mv "${srcdir}/Launcher.exe"       "${dstdir}"
	mv "${srcdir}/SHADERS.BNDL"       "${dstdir}"
	mv "${srcdir}/version.txt"        "${dstdir}"
	mv "${srcdir}/Core"               "${dstdir}"
	mv "${srcdir}/Support"            "${dstdir}"
	rm "${dstdir}/Support/localization.ini"

	# finalization
	rm -rf "${cabdir}"
	rm -rf "${srcdir}"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	strip-linguas ${LANGS}

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Need for Speed(TM) Hot Pursuit" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dodir "${GAMES_PREFIX_OPT}/${PN}/registry-patch"
	for f in en ${LINGUAS}; do
		cp "${DISTDIR}/${PN}_${f}.reg" "${D}/${GAMES_PREFIX_OPT}/${PN}/registry-patch/${f}.reg"
	done

	dogamesbin "${PN}"

	local res
	for res in 16 32 48 256; do
		newicon -s ${res} "${DISTDIR}/${PN}_${res}x${res}x32.png" "${PN}.png"
	done

	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
