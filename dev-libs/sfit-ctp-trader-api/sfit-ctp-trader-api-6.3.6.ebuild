# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils multilib multilib-minimal

DESCRIPTION="SFIT CTP trader API"
HOMEPAGE="http://www.sfit.com.cn/index.htm"
SRC_URI="http://www.sfit.com.cn/DocumentDown/api/v${PV}_20141230_traderapi_linux.tar"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE="+abi_x86_32 +abi_x86_64"
REQUIRED_USE="|| ( abi_x86_32 abi_x86_64 )"
RESTRICT="mirror"

DEPEND=""
RDEPEND=""

S=${WORKDIR}

multilib_src_install() {
	insinto "${EPREFIX}/usr/include/sfit-ctp"
	doins ${S}/v${PV}_20141230traderapi_linux32/*.h

	insinto "${EPREFIX}/usr/$(get_libdir)/sfit-ctp"
	exeinto "${EPREFIX}/usr/$(get_libdir)/sfit-ctp"
	if use abi_x86_32 ; then
		doins ${S}/v${PV}_20141230traderapi_linux32/error.xml
		doins ${S}/v${PV}_20141230traderapi_linux32/error.dtd
		doexe ${S}/v${PV}_20141230traderapi_linux32/*.so
	fi
	if use abi_x86_64 ; then
		doins ${S}/v${PV}_20141230traderapi_linux64/error.xml
		doins ${S}/v${PV}_20141230traderapi_linux64/error.dtd
		doexe ${S}/v${PV}_20141230traderapi_linux64/*.so
	fi
}
