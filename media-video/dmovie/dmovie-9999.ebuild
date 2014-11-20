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
         dev-python/python-ass
         dev-python/pysrt
         >=dev-python/PyQt5-5.3.2[declarative,multimedia,network,printsupport,webkit,widgets]"
DEPEND="${RDEPEND}"

#S=${WORKDIR}/${PN}-${MY_VER}

src_prepare() {
	rm locale/*.po*
}

src_install() {
	insinto "/usr/share/${PN}"
	doins -r ${S}/*

	echo "#!/bin/sh" > DMovie
	echo "python2 /usr/share/${PN}/main.py \\$@" >> DMovie
	dobin DMovie

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
