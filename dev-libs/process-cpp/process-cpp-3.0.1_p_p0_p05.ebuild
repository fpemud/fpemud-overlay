# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

URELEASE="zesty"
inherit cmake-utils ubuntu-versionator

UURL="mirror://unity/pool/main/p/${PN}"

DESCRIPTION="C++11 library for handling processes"
HOMEPAGE="http://launchpad.net/process-cpp"
SRC_URI="${UURL}/${MY_P}.orig.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc test"
RESTRICT="mirror"

DEPEND="doc? ( app-doc/doxygen )
        test? ( dev-cpp/gtest
                dev-cpp/gmock )
        dev-libs/boost:=
	dev-libs/properties-cpp"

S="${WORKDIR}/${PN}-${PV}${UVER_PREFIX}"

src_prepare() {
        eapply_user
        if ! use doc; then
                sed -i -e "s/add_subdirectory(doc)//g" "${S}/CMakeLists.txt"
        fi
	if ! use test; then
                sed -i -e "s/add_subdirectory(tests)//g" "${S}/CMakeLists.txt"
        fi
}

