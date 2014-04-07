# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils games

DESCRIPTION="Neighbours from Hell"
HOMEPAGE="http://www.${PN}.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/${PN}.png
         ftp://fpemud-workstation/distfiles-private/${PN}.zip
         ftp://fpemud-workstation/distfiles-private/${PN}-language-pack-zh_TW.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND=">=app-emulation/wine-1.6[abi_x86_32]"

LANGS="zh_TW"
for X in ${LANGS};
	do IUSE="${IUSE} linguas_${X}"
done

src_unpack() {
	return
}

src_prepare() {
	return
}

src_install() {
	strip-linguas ${LANGS}

	unzip -q "${DISTDIR}/${PN}.zip" -d "${D}"
        for f in ${LINGUAS}; do
		unzip -q "${DISTDIR}/${PN}-language-pack-${f}.zip" -d "${D}"
        done

	dogamesbin "${DISTDIR}/${PN}"
	doicon "${DISTDIR}/${PN}.png"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}
