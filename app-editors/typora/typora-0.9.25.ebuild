# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit eutils unpacker versionator

DESCRIPTION="a minimal Markdown reading & writing app."
HOMEPAGE="http://typora.io"
SRC_URI="
  amd64? ( https://typora.io/linux/${PN}_${PV}_amd64.deb )
  x86? ( https://typora.io/linux/${PN}_${PV}_i386.deb )
"

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
	fperms 0755 /usr/share/typora/Typora
}
