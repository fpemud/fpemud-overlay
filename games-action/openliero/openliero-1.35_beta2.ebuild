# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils games

DESCRIPTION="Almost exact clone of Liero"
HOMEPAGE="http://open.liero.be/"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}.bin
         ftp://fpemud-workstation/distfiles-private/liero-1.35b2-bundle.zip"
LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="media-libs/libsdl
         media-libs/sdl-mixer"
DEPEND="${RDEPEND}"

S=${WORKDIR}

src_unpack() {
	unzip "${DISTDIR}/liero-1.35b2-bundle.zip" -d "${WORKDIR}"

	# Restruct the directory.
	mv -vf "${WORKDIR}/liero-1.35b2-bundle" "${WORKDIR}/liero"

	mkdir -v "${WORKDIR}/default-config"
	mv -vf "${WORKDIR}/liero/LIERO.DAT" "${WORKDIR}/default-config"

	cp -vf "${DISTDIR}/${PN}.bin" "${WORKDIR}/liero/openliero"
	chmod -v 0755 "${WORKDIR}/liero/openliero"
}

src_prepare() {
        # Prepare the wrapper script
        sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/${PN}/g" \
            -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/${PN}/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}/${PN}"
	cp -r "default-config" "${D}/${GAMES_PREFIX_OPT}/${PN}"
	cp -r "liero" "${D}/${GAMES_PREFIX_OPT}/${PN}"

	dogamesbin "${PN}"
#       doicon "${DISTDIR}/${PN}.png"
        domenu "${DISTDIR}/${PN}.desktop"

        prepgamesdirs
}

