# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="KataGo neural networks (no outside data)"
HOMEPAGE="https://github.com/lightvector/KataGo"
SRC_URI="https://github.com/lightvector/KataGo/releases/download/v1.4.0/g170-b40c256x2-s3708042240-d967973220.bin.gz
         https://github.com/lightvector/KataGo/releases/download/v1.4.0/g170-b30c320x2-s3530176512-d968463914.bin.gz
         https://github.com/lightvector/KataGo/releases/download/v1.4.0/g170-b20c256x2-s4384473088-d968438914.bin.gz"

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
	insinto "/usr/share/katago-networks"

	fn=`echo ${A} | cut -d " " -f 1`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/katago-networks/pure-block40.bin.gz

	fn=`echo ${A} | cut -d " " -f 2`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/katago-networks/pure-block30.bin.gz

	fn=`echo ${A} | cut -d " " -f 3`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/katago-networks/pure-block20.bin.gz
}
