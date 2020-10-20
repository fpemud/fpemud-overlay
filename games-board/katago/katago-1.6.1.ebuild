# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils

DESCRIPTION="GTP engine and self-play learning in Go"
HOMEPAGE="https://github.com/lightvector/KataGo"

if [[ ${PV} == 9999 ]]; then
	EGIT_REPO_URI="https://github.com/lightvector/KataGo.git"
	inherit git-r3
else
	SRC_URI="https://github.com/lightvector/KataGo/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~sparc-solaris ~x64-solaris ~x86-solaris"
fi

LICENSE=""
SLOT="0"
IUSE="opencl cuda eigen"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/KataGo-${PV}/cpp"

src_configure() {
        local mycmakeargs=(
		-DNO_GIT_REVISION=1
	)
	if use opencl; then
		mycmakeargs+=(-DUSE_BACKEND=OPENCL)
	fi
	if use cuda; then
		mycmakeargs+=(-DUSE_BACKEND=CUDA)
	fi
	if use eigen; then
		mycmakeargs+=(-DUSE_BACKEND=EIGEN)
	fi
	cmake-utils_src_configure
}

src_install() {
	dobin ${BUILD_DIR}/katago
}
