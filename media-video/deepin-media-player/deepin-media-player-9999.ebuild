# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI="4"

inherit git-2 fdo-mime versionator eutils

DESCRIPTION="Deepin Media Player."
HOMEPAGE="https://github.com/linuxdeepin/deepin-media-player"
EGIT_REPO_URI="http://github.com/linuxdeepin/deepin-media-player.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=x11-libs/deepin-ui-1.201209101328
    dev-python/deepin-gsettings
	sci-libs/scipy
	dev-python/chardet
	dev-python/formencode
	dev-python/notify-python
	dev-python/beautifulsoup:python-2
	media-video/ffmpeg
	media-video/mplayer2"
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
