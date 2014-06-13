# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3
inherit eutils gnome2-utils games

DESCRIPTION="Portal"
HOMEPAGE="http://orange.half-life2.com/portal.html"
#SRC_URI="ftp://fpemud-workstation/distfiles-private/${PN}
#         ftp://fpemud-workstation/distfiles-private/${PN}.desktop
#         ftp://fpemud-workstation/distfiles-private/Portal.tar.gz"
SRC_URI="ftp://fpemud-workstation/distfiles-private/HL2.tar.gz"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="strip mirror"

DEPEND=""
RDEPEND=""

src_unpack() {
	return
}

src_prepare() {
	# Prepare the wrapper script
#	sed -e "s/^GAMEDIR=.*$/GAMEDIR=\/opt\/Portal/g" \
#	    -e "s/^DATADIR=.*$/DATADIR=~\/.local\/share\/Portal/g" "${DISTDIR}/${PN}" > "${WORKDIR}/${PN}"
	return

}

src_install() {
	dodir "${GAMES_PREFIX_OPT}"
	tar -xzf "${DISTDIR}/HL2.tar.gz" -C "${D}/${GAMES_PREFIX_OPT}"

#	dogamesbin "${PN}"
#	domenu "${DISTDIR}/${PN}.desktop"

#	prepgamesdirs
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

