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
	for fn in ${A}; do
		cp "${DISTDIR}/${fn}" "${WORKDIR}"
	done
}

src_install() {
	instlist=()
	if use block20; then
		instlist+=(20)
	fi
	if use block30; then
		instlist+=(30)
	fi
	if use block40; then
		instlist+=(40)
	fi
	for item in $instlist; do
		fn=`ls ${WORKDIR}/*$item*`
		bfn = `basename $fn`
		insinto "/usr/share/katago-networks"
		doins $fn
		echo "$fn" >> "${D}/usr/share/katago-networks/bbb"
		echo "$bfn" >> "${D}/usr/share/katago-networks/ccc"
		ln -sf "$bfn" "${D}/usr/share/katago-networks/pure-block${item}.bin.gz"
	done
}
