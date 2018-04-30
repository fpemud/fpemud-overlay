# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils

DESCRIPTION="high compression multimedia archiver"
SRC_URI="ftp://ftp.sac.sk/pub/sac/pack/uharc06b.zip"
LICENSE="freeware"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT="mirror"

DEPEND=""
RDEPEND="virtual/wine[abi_x86_32]"

S=${WORKDIR}

src_prepare() {
	# Prepare the wrapper script
	sed -e "s/^OPTDIR=.*$/OPTDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" "${FILESDIR}/${PN}" > "${WORKDIR}/${PN}"
}

src_install() {
	dobin "${PN}"
	rm -f "${PN}"

	dodir "opt/${PN}"
	cp * "${D}/opt/${PN}"
}
