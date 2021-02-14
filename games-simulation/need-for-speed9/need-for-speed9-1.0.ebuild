# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games check-reqs

DESCRIPTION="Need For Speed 9 - Most Wanted Black Edition"
HOMEPAGE="http://www.ea.com/need-for-speed-most-wanted"
SRC_URI="http://fpemud-distfiles.local/pub/${PN}.png
         http://fpemud-distfiles.local/pub/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD1.iso
         http://fpemud-distfiles.local/pub/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD2.iso
         http://fpemud-distfiles.local/pub/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD3.iso
         http://fpemud-distfiles.local/pub/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD4.iso
         http://fpemud-distfiles.local/pub/${PN}_update_zh_1.3.zip
         http://fpemud-distfiles.local/pub/${PN}_en_US.reg
         http://fpemud-distfiles.local/pub/${PN}_zh_TW.reg
         http://fpemud-distfiles.local/pub/nfs9_cd1.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip
        app-arch/p7zip"
RDEPEND="virtual/wine[abi_x86_32]"

CHECKREQS_DISK_BUILD=5G

LANGS="zh_TW"
for X in ${LANGS};
	do IUSE="${IUSE} linguas_${X}"
done

S="${WORKDIR}"

src_unpack() {

#	7z x "${DISTDIR}/Need.for.Speed.Most.Wanted.Black.Edition.CD1.iso" -o"${WORKDIR}/nfs9_cd1"
	mkdir "${WORKDIR}/nfs9_cd1"
	unzip "${DISTDIR}/nfs9_cd1.zip" -d "${WORKDIR}/nfs9_cd1"

	7z x "${DISTDIR}/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD2.iso" -o"${WORKDIR}/nfs9_cd2"
	7z x "${DISTDIR}/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD3.iso" -o"${WORKDIR}/nfs9_cd3"
	7z x "${DISTDIR}/Need.for.Speed.Most.Wanted.Black.Edition.zh_TW.CD4.iso" -o"${WORKDIR}/nfs9_cd4"

	# Restruct the directory.
	mkdir "${WORKDIR}/Need For Speed Most Wanted"

	unzip "${WORKDIR}/nfs9_cd1/0compressed.zip" -d "${WORKDIR}/Need For Speed Most Wanted"
	unzip "${WORKDIR}/nfs9_cd2/1compressed.zip" -d "${WORKDIR}/Need For Speed Most Wanted"
	unzip "${WORKDIR}/nfs9_cd3/2compressed.zip" -d "${WORKDIR}/Need For Speed Most Wanted"
	unzip "${WORKDIR}/nfs9_cd4/3compressed.zip" -d "${WORKDIR}/Need For Speed Most Wanted"

	mkdir -p "${WORKDIR}/language-pack/en_US"
	mkdir -p "${WORKDIR}/language-pack/zh_TW"
	unzip "${WORKDIR}/nfs9_cd4/0en-us_compressed.zip" -d "${WORKDIR}/language-pack/en_US"
	unzip "${WORKDIR}/nfs9_cd4/0zh-tw_compressed.zip" -d "${WORKDIR}/language-pack/zh_TW"
	mkdir "${WORKDIR}/language-pack/en_US/Support"
	mv "${WORKDIR}/nfs9_cd1/Support/en-us" "${WORKDIR}/language-pack/en_US/Support"
	mkdir "${WORKDIR}/language-pack/zh_TW/Support"
	mv "${WORKDIR}/nfs9_cd1/Support/zh-tw" "${WORKDIR}/language-pack/zh_TW/Support"

	cp -r "${WORKDIR}/nfs9_cd1/Support"   "${WORKDIR}/Need For Speed Most Wanted"
	cp "${WORKDIR}/nfs9_cd1/00000000.256" "${WORKDIR}/Need For Speed Most Wanted"
	cp "${WORKDIR}/nfs9_cd1/nfsMW.exe"    "${WORKDIR}/Need For Speed Most Wanted"
	cp "${WORKDIR}/nfs9_cd1/readme.txt"   "${WORKDIR}/Need For Speed Most Wanted"
	cp "${WORKDIR}/nfs9_cd1/server.cfg"   "${WORKDIR}/Need For Speed Most Wanted"

	rm -rf "${WORKDIR}/nfs9_cd1"
	rm -rf "${WORKDIR}/nfs9_cd2"
	rm -rf "${WORKDIR}/nfs9_cd3"
	rm -rf "${WORKDIR}/nfs9_cd4"
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
	cp -r "Need For Speed Most Wanted" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dodir "${GAMES_PREFIX_OPT}/${PN}/language-pack"
	for f in en_US ${LINGUAS}; do
		cp -r "language-pack/${f}" "${D}/${GAMES_PREFIX_OPT}/${PN}/language-pack"
	done

	dodir "${GAMES_PREFIX_OPT}/${PN}/registry-patch"
	for f in en_US ${LINGUAS}; do
		cp -r "${DISTDIR}/${PN}_${f}.reg" "${D}/${GAMES_PREFIX_OPT}/${PN}/registry-patch/${f}.reg"
	done

	dogamesbin "${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${FILESDIR}/${PN}.desktop"

	prepgamesdirs
}
