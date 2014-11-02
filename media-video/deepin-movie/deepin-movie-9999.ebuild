# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit git-2 fdo-mime versionator eutils

DESCRIPTION="Deepin Movie."
HOMEPAGE="https://github.com/linuxdeepin/deepin-movie"
EGIT_REPO_URI="http://github.com/linuxdeepin/deepin-movie.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-qt/assistant-5.3.2
	>=dev-qt/designer-5.3.2
	>=dev-qt/linguist-5.3.2
	>=dev-qt/linguist-tools-5.3.2
	>=dev-qt/pixeltool-5.3.2
	>=dev-qt/qdbus-5.3.2
	>=dev-qt/qdbusviewer-5.3.2
	>=dev-qt/qdoc-5.3.2
	>=dev-qt/qtconcurrent-5.3.2
	>=dev-qt/qtcore-5.3.2
	>=dev-qt/qtdbus-5.3.2
	>=dev-qt/qtdeclarative-5.3.2
	>=dev-qt/qtdiag-5.3.2
	>=dev-qt/qtgraphicaleffects-5.3.2
	>=dev-qt/qtgui-5.3.2
	>=dev-qt/qthelp-5.3.2
	>=dev-qt/qtimageformats-5.3.2
	>=dev-qt/qtmultimedia-5.3.2
	>=dev-qt/qtnetwork-5.3.2
	>=dev-qt/qtopengl-5.3.2
	>=dev-qt/qtpaths-5.3.2
	>=dev-qt/qtpositioning-5.3.2
	>=dev-qt/qtprintsupport-5.3.2
	>=dev-qt/qtquick1-5.3.2
	>=dev-qt/qtquickcontrols-5.3.2
	>=dev-qt/qtscript-5.3.2
	>=dev-qt/qtsensors-5.3.2
	>=dev-qt/qtserialport-5.3.2
	>=dev-qt/qtsql-5.3.2
	>=dev-qt/qtsvg-5.3.2
	>=dev-qt/qttest-5.3.2
	>=dev-qt/qttranslations-5.3.2
	>=dev-qt/qtwebkit-5.3.2
	>=dev-qt/qtwebsockets-5.3.2
	>=dev-qt/qtwidgets-5.3.2
	>=dev-qt/qtx11extras-5.3.2
	>=dev-qt/qtxml-5.3.2
	>=dev-qt/qtxmlpatterns-5.3.2
	>=dev-python/sip-4.15.3
	>=dev-python/PyQt5-5.3.2"
DEPEND="${RDEPEND}"
S=${WORKDIR}/${PN}-${MY_VER}
src_prepare() {
	rm locale/*.po* 

	# add patch for mplayer binary name problem
	#epatch ${FILESDIR}/deepin-media-player-backend.patch
	#sed -i "s|\"mplayer\"|\"mplayer2\"|g" ${S}/src/mplayer/player.py
	#sed -i "s|mplayer\ |mplayer2\ |g" ${S}/src/mplayer/player.py
}

src_install() {
	insinto "/usr/share/"
	doins -r ${S}/locale

	insinto "/usr/share/${PN}"
	doins -r  ${S}/src ${S}/app_theme ${S}/skin ${S}/image
	fperms 0755 -R /usr/share/${PN}/src/

	#dosym /usr/share/${PN}/src/main.py /usr/bin/${PN}
	echo "#!/bin/sh" > ${PN}
	echo "python2 /usr/share/${PN}/src/${PN}.py" >> ${PN}
	dobin ${PN}

	doicon -s 128 ${FILESDIR}/${PN}.png

	insinto "/usr/share/applications"
	doins ${FILESDIR}/${PN}.desktop
}

pkg_postinst() {
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_desktop_database_update
}
