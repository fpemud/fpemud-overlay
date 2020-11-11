# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils games

DESCRIPTION="Beholder"
HOMEPAGE="http://www.neighbours-from-hell.com"
SRC_URI="mirror://linuxgame/Beholder_amd64.AppImage"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT=""

DEPEND="app-arch/unzip"
RDEPEND=""

S=${WORKDIR}/squashfs-root

pkg_nofetch() {
	echo
	elog "Download ${SRC_URI} from ${HOMEPAGE} and place it in ${DISTDIR}"
	echo
}

src_unpack() {
	cp "${DISTDIR}/${A}" "${WORKDIR}"
	chmod +x "${WORKDIR}/${A}"
	"${WORKDIR}/${A}" --appimage-extract

	# remove 32-bit stuff
	rm -f ${S}/usr/bin/Beholder.x86
	find ${S}/usr/bin -wholename "*/x86" | xargs rm -rf
}

src_prepare() {
	return
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/Beholder"
	cp -r usr/bin/* "${D}/${GAMES_PREFIX_OPT}/Beholder"

	doicon "${FILESDIR}/${PN}.png"
	make_desktop_entry "${PN}" "Beholder" "${PN}"
	games_make_wrapper "${PN}" "./Beholder.x86_64" "${GAMES_PREFIX_OPT}/Beholder"
	prepgamesdirs
}
