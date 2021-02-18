# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-utils eutils git-r3

DESCRIPTION="This is Pluggable Authentication Module for Face based Authentication"
HOMEPAGE="http://pam-face-authentication.org"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/pam-face-authentication.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug"

DEPEND="
	>=media-libs/opencv-1.0.0
	>=sci-libs/gsl-1.9
	virtual/pam
"
RDEPEND="${DEPEND}"

DOCS=( AUTHORS ChangeLog README )

S="${WORKDIR}/qtbranch"

src_prepare() {
	epatch "${FILESDIR}"/${PN}-0.3-cmake.patch
	epatch "${FILESDIR}"/${PN}-0.3-opencv.patch

	cp /usr/share/OpenCV/OpenCVConfig.cmake cmake/modules/FindOpenCV.cmake || die
	sed -i cmake/modules/FindOpenCV.cmake \
		-e 's:${OpenCV_INSTALL_PATH}:/usr:' || die
}

pkg_extra_files() {
        echo "~/.pam-face-authentication/***"
}
