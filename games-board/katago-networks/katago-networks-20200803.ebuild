# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="Final neural networks for the June 2020 (\"g170\") run"
HOMEPAGE="https://github.com/lightvector/KataGo"
SRC_URI="https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b40c256x2-s5095420928-d1229425124.bin.gz -> ${P}_b40.bin.gz
         https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170-b30c320x2-s4824661760-d1229536699.bin.gz -> ${P}_b30.bin.gz
         https://github.com/lightvector/KataGo/releases/download/v1.4.5/g170e-b20c256x2-s5303129600-d1228401921.bin.gz -> ${P}_b20.bin.gz"

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
		fn=*$item*
		insinto "/usr/share/${PN%-*}"
		ln -f -s "$fn" "${D}/usr/share/${PN%-*}/block${item}.bin.gz"
	done
}
