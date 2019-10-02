# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{3_3,3_4,3_5,3_6,3_7} )

inherit distutils-r1

DESCRIPTION="A torrent searching application"
HOMEPAGE="http://torrent-search.sourceforge.net/"
SRC_URI="mirror://sourceforge/torrent-search/${PN}_${PV}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="gnome"

DEPEND=""
RDEPEND=">=dev-python/httplib2-0.6.0
	dev-python/pygtk:2
	>=dev-python/dbus-python-0.83
	>=dev-libs/libxml2-2.7.6[python]
	gnome? ( dev-python/gnome-applets-python )"
S="${WORKDIR}/${PN}"

src_install() {
	distutils_src_install
	if ! use gnome; then
		rm "${ED}"usr/bin/torrent-search-gnomeapplet* || die
		rm "${ED}"usr/lib/bonobo/servers/TorrentSearch_Applet.server || die
	fi
}
