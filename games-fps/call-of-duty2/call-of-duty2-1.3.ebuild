# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils gnome2-utils games check-reqs

DESCRIPTION="Call of Duty 2"
HOMEPAGE=""
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}_16x16x8.png
         ftp://fpemud-workstation/distfiles-private/${PN}_32x32x8.png
         ftp://fpemud-workstation/distfiles-private/${PN}_48x48x32.png
         ftp://fpemud-workstation/distfiles-private/Call.of.Duty.2.iso
         ftp://fpemud-workstation/distfiles-private/${PN}_patch_13.zip
         ftp://fpemud-workstation/distfiles-private/${PN}_doc_language_pack_zh_CN.zip
         ftp://fpemud-workstation/distfiles-private/${PN}_language_pack_zh_CN.zip
         ftp://fpemud-workstation/distfiles-private/${PN}_lang_eng.reg
         ftp://fpemud-workstation/distfiles-private/${PN}_lang_chs.reg"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

CHECKREQS_DISK_BUILD=5G

LANGS="en_GB zh_CN"
for X in ${LANGS};
	do IUSE="${IUSE} linguas_${X}"
done

get_lang_dir_with_fallback() {

	local lDir=$1
	local l=$2
	local la=(${l//_/ })

	if [ -d "$lDir/$l" ] ; then
		echo "$lDir/$l"
		return 0
	fi
	if [ -d "$lDir/$la" ] ; then
		echo "$lDir/$la"
		return 0
	fi
	return 1
}

src_unpack() {
	local arr=${LINGUAS}

	7z x "${DISTDIR}/Call.of.Duty.2.iso" -o"${WORKDIR}/cod2_cd"

	# Restruct the directory.
	mv "${WORKDIR}/cod2_cd/Setup/Data" "${WORKDIR}/Call of Duty 2"
	mkdir "${WORKDIR}/Call of Duty 2/Docs"

	# upgrade to version 1.3
	unzip -o "${DISTDIR}/${PN}_patch_13.zip" -d "${WORKDIR}/Call of Duty 2"

	# add languages
#	if [[ "${arr[@]}" =~ "zh_CN " || "${arr[${#arr[@]}-1]}" == "zh_CN" ]]; then
		unzip "${DISTDIR}/${PN}_language_pack_zh_CN.zip" -x "localization.txt" -d "${WORKDIR}/Call of Duty 2/main"
#	fi

	# create language-pack directory
	mkdir -p "${WORKDIR}/language-pack/en"
	mv "${WORKDIR}/Call of Duty 2/localization.txt" "${WORKDIR}/language-pack/en"
	cp "${DISTDIR}/${PN}_lang_eng.reg" "${WORKDIR}/language-pack/en/lang.reg"

	mkdir -p "${WORKDIR}/language-pack/zh_CN"
	unzip "${DISTDIR}/${PN}_language_pack_zh_CN.zip" "localization.txt" -d "${WORKDIR}/language-pack/zh_CN"
	cp "${DISTDIR}/${PN}_lang_chs.reg" "${WORKDIR}/language-pack/zh_CN/lang.reg"

	# create doc-language-pack directory
	mkdir -p "${WORKDIR}/doc-language-pack/en_US/Docs"
	mv "${WORKDIR}/cod2_cd/Docs/License/ENU"/* "${WORKDIR}/doc-language-pack/en_US/Docs"
	mv "${WORKDIR}/cod2_cd/Docs/MSR/ENU"/*     "${WORKDIR}/doc-language-pack/en_US/Docs"
	mv "${WORKDIR}/cod2_cd/Docs/TechHelp/ENU"  "${WORKDIR}/doc-language-pack/en_US/Docs/TechHelp"
	cp "${WORKDIR}/Call of Duty 2/Docs"/*      "${WORKDIR}/doc-language-pack/en_US/Docs"

	if [[ "${arr[@]}" =~ "en_GB " || "${arr[${#arr[@]}-1]}" == "en_GB" ]]; then
		mkdir -p "${WORKDIR}/doc-language-pack/en_GB/Docs"
		mv "${WORKDIR}/cod2_cd/Docs/License/ENG"/* "${WORKDIR}/doc-language-pack/en_GB/Docs"
		mv "${WORKDIR}/cod2_cd/Docs/MSR/ENG"/*     "${WORKDIR}/doc-language-pack/en_GB/Docs"
		mv "${WORKDIR}/cod2_cd/Docs/TechHelp/ENG"  "${WORKDIR}/doc-language-pack/en_GB/Docs/TechHelp"
		cp "${WORKDIR}/Call of Duty 2/Docs"/*      "${WORKDIR}/doc-language-pack/en_GB/Docs"
	fi

#	if [[ "${arr[@]}" =~ "zh_CN " || "${arr[${#arr[@]}-1]}" == "zh_CN" ]]; then
		mkdir -p "${WORKDIR}/doc-language-pack/zh_CN/Docs"
		unzip "${DISTDIR}/${PN}_doc_language_pack_zh_CN.zip" -d "${WORKDIR}/doc-language-pack/zh_CN/Docs"
#	fi

	rm -rf "${WORKDIR}/Call of Duty 2/Docs"/*
	rm -rf "${WORKDIR}/cod2_cd"
}

src_prepare() {

	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	strip-linguas ${LANGS}

	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "Call of Duty 2" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dodir "${GAMES_PREFIX_OPT}/${PN}/language-pack"
	dodir "${GAMES_PREFIX_OPT}/${PN}/doc-language-pack"
	for f in en_US ${LINGUAS}; do
		local l=`get_lang_dir_with_fallback "language-pack" ${f}`
		if [ ! -d "${D}/${GAMES_PREFIX_OPT}/${PN}/language-pack/${l}" ] ; then
			cp -r "${l}" "${D}/${GAMES_PREFIX_OPT}/${PN}/language-pack"
		fi

		cp -r "doc-language-pack/${f}" "${D}/${GAMES_PREFIX_OPT}/${PN}/doc-language-pack"
	done

	dogamesbin "${PN}"

	newicon -s 16 "${DISTDIR}/${PN}_16x16x8.png" "${PN}.png"
	newicon -s 32 "${DISTDIR}/${PN}_32x32x8.png" "${PN}.png"
	newicon -s 48 "${DISTDIR}/${PN}_48x48x32.png" "${PN}.png"

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
	echo "~/.local/share/call-of-duty2/***"
}
