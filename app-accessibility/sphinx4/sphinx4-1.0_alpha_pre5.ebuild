# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit java-pkg-2 java-pkg-simple versionator

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

CDEPEND="dev-java/testng:0
         dev-java/hamcrest-library:1.3
         dev-java/commons-math:3"
RDEPEND=">=virtual/jre-1.6
         ${CDEPEND}"
DEPEND=">=virtual/jdk-1.6
        ${CDEPEND}"

S="${WORKDIR}/${PN}-${MY_PV}-src"
JAVA_GENTOO_CLASSPATH="testng,hamcrest-library-1.3,commons-math-3"
JAVA_SRC_DIR="sphinx4-core/src/main/java"

src_compile() {
	java-pkg-simple_src_compile
	java-pkg_addres ${PN}.jar sphinx4-core/src/main/resources
}
