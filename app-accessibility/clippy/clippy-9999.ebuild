# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit gnome2-utils git-r3

DESCRIPTION=""
HOMEPAGE="https://github.com/fpemud/clippy"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/clippy.git"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

pkg_preinst() {
	gnome2_schemas_savelist
#	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_schemas_update
#	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
#	gnome2_icon_cache_update
}