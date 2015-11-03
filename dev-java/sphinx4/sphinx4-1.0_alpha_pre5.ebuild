# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple versionator

MY_PV1=$(get_version_component_range '3')
MY_PV2=$(get_version_component_range '4' | sed -r 's/([a-zA-Z]+)([0-9]+)/\2\1/g')
MY_PV=${MY_PV2}${MY_PV1}

MY_P="${PN}-${MY_PV}-src"

DESCRIPTION="A speech recognizer written entirely in the Java programming language: Core"
HOMEPAGE="http://cmusphinx.sourceforge.net/"
SRC_URI="http://sourceforge.net/projects/cmusphinx/files/${PN}/${MY_PV}/${MY_P}.zip"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"

CDEPEND="dev-java/testng:0
         dev-java/hamcrest-core:1.3
         dev-java/hamcrest-library:1.3
         dev-java/commons-math:3"
RDEPEND=">=virtual/jre-1.6
         ${CDEPEND}"
DEPEND=">=virtual/jdk-1.6
        ${CDEPEND}"

S="${WORKDIR}/${MY_P}"

src_compile() {
	# compile sphinx4-core
	JAVA_GENTOO_CLASSPATH="hamcrest-library-1.3,commons-math-3"
	JAVA_SRC_DIR="${PN}-core/src/main/java"
	JAVA_JAR_FILENAME="${PN}-core.jar"
	java-pkg-simple_src_compile
	java-pkg_addres "${PN}-core.jar" "${PN}-core/src/main/resources"

	# compile
	JAVA_GENTOO_CLASSPATH="testng,hamcrest-core-1.3,hamcrest-library-1.3"
	JAVA_CLASSPATH_EXTRA="${PN}-core.jar"
	JAVA_SRC_DIR="${PN}-core/src/test/java"
	JAVA_JAR_FILENAME="${PN}-test.jar"
	java-pkg-simple_src_compile
	java-pkg_addres "${PN}-test.jar" "${PN}-core/src/test/resources"

}

src_install() {
	java-pkg_dojar "${PN}-core.jar"

	use doc && java-pkg_dojavadoc "${PN}-core/src/main/javadoc"
	use source && java-pkg_dosrc "${PN}-core/src/main/java"
}
