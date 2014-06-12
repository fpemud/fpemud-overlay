# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Kerbal Space Program"
HOMEPAGE="https://www.kerbalspaceprogram.com"
SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
         ftp://fpemud-workstation/distfiles-private/ksp-linux-0-21-0.zip"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND="app-arch/unzip"
RDEPEND="media-fonts/corefonts"

src_unpack() {
	unzip "${DISTDIR}/ksp-linux-0-21-0.zip" -d "${WORKDIR}"
	find "${WORKDIR}" -type f -print0 | xargs -0 chmod 644
	find "${WORKDIR}" -type d -print0 | xargs -0 chmod 755
}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/KSP_linux/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/KSP_linux/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dodir "${GAMES_PREFIX_OPT}"
	cp -r "KSP_linux" "${D}/${GAMES_PREFIX_OPT}"

	dogamesbin "${PN}"
	domenu "${DISTDIR}/${PN}.desktop"

	prepgamesdirs
}

#pkg_preinst() {
#	gnome2_icon_savelist
#}
#
#pkg_postinst() {
#	gnome2_icon_cache_update
#}
#
#pkg_postrm() {
#	gnome2_icon_cache_update
#}

