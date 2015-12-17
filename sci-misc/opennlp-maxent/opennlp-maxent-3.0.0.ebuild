# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

JAVA_PKG_IUSE="source examples doc"
inherit eutils java-pkg-2 java-ant-2

DESCRIPTION="Maximum entropy model implementation for opennlp."
HOMEPAGE="http://maxent.sf.net/"
SRC_URI="http://sourceforge.net/projects/maxent/files/Maxent/${PV}/${P}-src.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86"

IUSE="${IUSE}"

DEPEND=">=virtual/jdk-1.5"
RDEPEND=">=virtual/jre-1.5"

EANT_BUILD_TARGET="compile package"

src_unpack() {
	unpack ${A}
	cd "${S}"/lib
	rm -v *.jar || die "failed to rm jars"
}

src_install() {
	java-pkg_newjar output/maxent-${PV}.jar
	java-pkg_dohtml docs/*html docs/*css docs/*jpg
	if use doc ; then
		java-pkg_dojavadoc docs/api
	fi
	if use source ; then
		java-pkg_dosrc src/main/java
	fi
	if use examples ; then
		java-pkg_doexamples samples
	fi
	dodoc AUTHORS CHANGES COMMANDLINE README
	# java-pkg_dolauncher
}
