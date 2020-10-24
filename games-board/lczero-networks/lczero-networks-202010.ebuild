# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

DESCRIPTION="Best Nets for Lc0"
HOMEPAGE="https://github.com/LeelaChessZero/lc0/wiki/Best-Nets-for-Lc0"

SRC_URI="${SRC_URI} https://www.comp.nus.edu.sg/~sergio-v/t60/384x30/384x30-t60-4619.pb.gz -> Sergio-V_384x30-t60-4619.pb.gz"
SRC_URI="${SRC_URI} https://training.lczero.org/get_network?sha=f321fee741e4640c5eceddd2f1dedcd91db191770c013044d5468f8a1329abd2 -> lc0-run1_20201001.gz"    # first run 1 network in 2020-10-01
SRC_URI="${SRC_URI} https://www.patreon.com/file?h=36263859&i=5469678 -> Leelenstein-14.3_20x256SE-jj-9-65420000.pb.gz"
SRC_URI="${SRC_URI} https://www.comp.nus.edu.sg/~sergio-v/new/128x10-t60-2/128x10-t60-2-5300.pb.gz -> Sergio-V_128x10-t60-2-5300.pb.gz"

LICENSE="unknown"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+block10 +block20 +block24 +block30"

RESTRICT="mirror"

S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	insinto "/usr/share/${PN}"

	fn=`echo ${A} | cut -d " " -f 1`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block30.bin.gz

	fn=`echo ${A} | cut -d " " -f 2`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block24.bin.gz

	fn=`echo ${A} | cut -d " " -f 3`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block20.bin.gz

	fn=`echo ${A} | cut -d " " -f 4`
	doins "${DISTDIR}/${fn}"
	dosym "${fn}" /usr/share/${PN}/block10.bin.gz
}
