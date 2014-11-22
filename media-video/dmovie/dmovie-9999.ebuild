# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5

inherit git-2 fdo-mime eutils

DESCRIPTION="DMovie"
HOMEPAGE="https://github.com/fpemud/dmovie"
EGIT_REPO_URI="http://github.com/fpemud/dmovie.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="x11-libs/xpyb
         x11-libs/xpybutil
         x11-libs/deepin-menu
         dev-qt/deepin-qml-widgets
         dev-qt/qtgraphicaleffects
         dev-qt/qtmultimedia[qml]
         dev-qt/qtquickcontrols
         dev-qt/qtwebkit[qml]
         dev-python/python-ass
         dev-python/pysrt
         dev-python/dbus-python
         >=dev-python/python-magic-0.4.6-r1
         >=dev-python/PyQt5-5.3.2[dbus,declarative,multimedia,network,printsupport,webkit,widgets]"
DEPEND=""

src_install() {
	default

	doicon -s 128 ${S}/image/deepin-movie.svg

	insinto "/usr/share/applications"
	doins ${S}/DMovie.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
