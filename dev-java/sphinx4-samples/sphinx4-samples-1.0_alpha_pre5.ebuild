# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit java-pkg-2 java-pkg-simple versionator

MY_PN="sphinx4"

MY_PV1=$(get_version_component_range '3')
MY_PV2=$(get_version_component_range '4' | sed -r 's/([a-zA-Z]+)([0-9]+)/\2\1/g')
MY_PV=${MY_PV2}${MY_PV1}

MY_P="${MY_PN}-${MY_PV}-src"

DESCRIPTION="A speech recognizer written entirely in the Java programming language: Samples"
HOMEPAGE="http://cmusphinx.sourceforge.net/"
SRC_URI="http://sourceforge.net/projects/cmusphinx/files/${MY_PN}/${MY_PV}/${MY_P}.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"

CDEPEND="dev-java/sphinx4-core:0
         dev-java/sphinx4-data:0"
RDEPEND=">=virtual/jre-1.6
         ${CDEPEND}"
DEPEND=">=virtual/jdk-1.6
        ${CDEPEND}"

S="${WORKDIR}/${MY_P}"
JAVA_GENTOO_CLASSPATH="sphinx4-core,sphinx4-data"
JAVA_SRC_DIR="${PN}/src/main/java"

src_compile() {
	java-pkg-simple_src_compile
#	java-pkg_addres ${PN}.jar ${PN}/src/main/resources
	java-pkg_addres ${PN}.jar ${MY_PN}-data/src/main/resources
}

src_install() {
	java-pkg_dojar ${PN}.jar
	java-pkg_dolauncher DemoRunner --main edu.cmu.sphinx.demo.DemoRunner
}
