# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="A very simple, fast, multithreaded, platform independent HTTP and HTTPS server and client library."
HOMEPAGE="https://gitlab.com/eidheim/Simple-Web-Server"
SRC_URI="https://gitlab.com/eidheim/Simple-Web-Server/-/archive/v${PV}/${PN}-v${PV}.tar.bz2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/${PN}-v${PV}
