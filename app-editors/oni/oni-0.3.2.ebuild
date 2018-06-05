# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils unpacker versionator

DESCRIPTION="Modern Modal Editing - powered by Neovim"
HOMEPAGE="http://onivim.io"
SRC_URI="https://github.com/onivim/${PN}/releases/download/v${PV}/Oni-${PV}-amd64-linux.deb"

LICENSE="GitHub"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="${DEPEND}
        app-editors/neovim
"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r usr
	doins -r opt
	fperms 0755  /opt/Oni/${PN}
	dosym "/opt/Oni/${PN}" "/usr/local/bin/${PN}"
}
