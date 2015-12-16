# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit java-pkg-2 java-ant-2

DESCRIPTION="LingPipe is tool kit for processing text using computational linguistics."
HOMEPAGE="http://alias-i.com/lingpipe"
SRC_URI="http://lingpipe-download.s3.amazonaws.com/${P}.tar.gz"

LICENSE="AGPL"
KEYWORDS="~x86 ~amd64"
SLOT="0"

RDEPEND=">=virtual/jre-1.6"
DEPEND=">=virtual/jdk-1.6"

src_install() {
	java-pkg_newjar ${P}.jar
}
