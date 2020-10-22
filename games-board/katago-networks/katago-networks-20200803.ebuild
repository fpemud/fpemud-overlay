# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Final neural networks for the June 2020 (\"g170\") run"
HOMEPAGE="https://github.com/lightvector/KataGo"
SRC_URI="https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b40c256x2-s5095420928-d1229425124.bin.gz
         https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b30c320x2-s4824661760-d1229536699.bin.gz
         https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170e-b20c256x2-s5303129600-d1228401921.bin.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+block20 +block30 +block40"

RESTRICT="mirror"

S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	insinto "/usr/share/${PN}"

	fn=`echo ${A} | cut -d " " -f 1`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block40.bin.gz

	fn=`echo ${A} | cut -d " " -f 2`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block30.bin.gz

	fn=`echo ${A} | cut -d " " -f 3`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block20.bin.gz
}
