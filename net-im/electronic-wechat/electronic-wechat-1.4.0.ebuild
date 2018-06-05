# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils unpacker versionator

DESCRIPTION="A better WeChat on Mac OS X and Linux. Fewer bugs, more features. Build with Electron."
HOMEPAGE="https://github.com/geeeeeeeeek/electronic-wechat"
SRC_BASE="https://github.com/geeeeeeeeek/${PN}/releases/download/v${PV}"
SRC_URI="
  amd64? ( ${SRC_BASE}/linux-x64.tar.gz -> ${P}-amd64.tar.gz )
  x86? ( ${SRC_BASE}/linux-ia32.tar.gz -> ${P}-i386.tar.gz )
"

LICENSE="GitHub"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="${DEPEND}
	x11-libs/libnotify
"

S=${WORKDIR}

src_prepare(){
	mv electronic-wechat* ${PN}
}

src_install() {
	insinto /opt
	doins -r ${S}/${PN}
	fperms 0755 /opt/${PN}/electronic-wechat
	dosym "/opt/${PN}/electronic-wechat" /usr/bin/electronic-wechat
}
