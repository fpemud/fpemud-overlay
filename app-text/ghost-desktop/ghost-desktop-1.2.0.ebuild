# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils unpacker versionator

DESCRIPTION="Ghost Desktop is a beautiful desktop application that allows you to easily manage multiple Ghost blogs and work without distractions."
HOMEPAGE="https://github.com/TryGhost/Ghost-Desktop"
SRC_URI="https://github.com/TryGhost/Ghost-Desktop/releases/download/v${PV}/${P}-debian.deb"

LICENSE="GitHub"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="mirror strip"

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}

src_install() {
	insinto /
	doins -r usr
	fperms 0755 /usr/share/Ghost/Ghost
}
