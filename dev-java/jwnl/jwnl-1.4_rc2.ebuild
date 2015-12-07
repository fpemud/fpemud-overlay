# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

JAVA_PKG_IUSE="doc source test"

inherit java-pkg-2 java-pkg-simple

MY_PV=${PV//_/-}
MY_PV=${MY_PV//\./}
MY_P=${PN}${MY_PV}

DESCRIPTION="JWNL is a Java API for accessing the WordNet relational dictionary."
HOMEPAGE="http://jwordnet.sourceforge.net/"
SRC_URI="http://sourceforge.net/projects/jwordnet/files/${PN}/${PN^^}%20${PV//_*/}/${MY_P}.zip"

LICENSE="GPL-2"
KEYWORDS="~x86 ~amd64"
SLOT="0"

CDEPEND="dev-java/commons-logging:0"
RDEPEND=">=virtual/jre-1.6
         ${CDEPEND}"
DEPEND=">=virtual/jdk-1.6
        ${CDEPEND}"

S="${WORKDIR}/${MY_P}"
JAVA_GENTOO_CLASSPATH="commons-logging"
JAVA_SRC_DIR="src"

java_prepare() {
	rm -rf ${S}/${JAVA_SRC_DIR}/test
}

src_install() {
	java-pkg_dojar ${JAVA_JAR_FILENAME}

	use doc && java-pkg_dojavadoc ${PN}/src/main/javadoc
	use source && java-pkg_dosrc ${PN}/src/main/java
}
