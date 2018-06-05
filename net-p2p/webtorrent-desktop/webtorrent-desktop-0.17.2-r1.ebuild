# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils unpacker versionator

DESCRIPTION="The streaming torrent client. For OS X, Windows, and Linux."
HOMEPAGE="https://github.com/feross/webtorrent-desktop"
MY_PR=${PR:1}
SRC_BASE="https://github.com/feross/${PN}/releases/download/"
SRC_URI="
  amd64? ( ${SRC_BASE}v${PV}/${PN}_${PV}-${MY_PR}_amd64.deb )
  x86? ( ${SRC_BASE}v${PV}/${PN}_${PV}-${MY_PR}_i386.deb )
"

LICENSE="GitHub"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r ${S}/opt
	fperms 0755 /opt/${PN}/WebTorrent
	dosym "/opt/${PN}/WebTorrent" /usr/bin/webtorrent-desktop
}
