# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils user

DESCRIPTION="Wallet for the anonymous cryptocoin Monero"
HOMEPAGE="https://getmonero.org"
SRC_URI="https://github.com/monero-project/${PN}/archive/v${PV}.tar.gz -> ${PN}-${PV}.tar.gz"
LICENSE="monero"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=net-dns/unbound-1.4.16
	>=dev-libs/boost-1.58
	dev-libs/openssl[-bindist]
	>=dev-libs/libevent-2.0
	>=dev-cpp/gtest-1.5"

RDEPEND="${DEPEND}
	!<dev-libs/boost-1.58"

src_configure() {
	cmake-utils_src_configure
}

src_install() {
	BINPATH="${WORKDIR}/${P}_build/bin"
	dobin ${BINPATH}/bitmonerod
	dobin ${BINPATH}/connectivity_tool
	dobin ${BINPATH}/simpleminer
	dobin ${BINPATH}/simplewallet
	newconfd ${FILESDIR}/bitmonerod.conf.d bitmonerod
	newinitd ${FILESDIR}/bitmonerod.init.d bitmonerod
}

pkg_postinst() {
	enewgroup monero
	enewuser monero -1 -1 /var/lib/monero "monero"
}
