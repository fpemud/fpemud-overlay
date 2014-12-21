# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit java-pkg-2 java-ant-2 versionator

MY_PV1=$(get_version_component_range '3')
MY_PV2=$(get_version_component_range '4' | sed -r 's/([a-zA-Z]+)([0-9]+)/\2\1/g')
MY_PV=${MY_PV2}${MY_PV1}

DESCRIPTION="A speech recognizer written entirely in the Java programming language"
HOMEPAGE="http://cmusphinx.sourceforge.net/"
SRC_URI="http://sourceforge.net/projects/cmusphinx/files/${PN}/${MY_PV}/${PN}-${MY_PV}-src.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64"
IUSE="demo"
SLOT="0"

RDEPEND=">=virtual/jre-1.6"
DEPEND=">=virtual/jdk-1.6"

EANT_BUILD_TARGET="all"
S="${WORKDIR}/${PN}-${MY_PV}"

src_install() {
	java-pkg_dojar "lib/${PN}.jar"
}
