# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-2

DESCRIPTION="media playback based on Qt, FFmpeg and Cuda"
HOMEPAGE="https://github.com/wang-bin/QtAV"
EGIT_REPO_URI="https://github.com/wang-bin/QtAV.git"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/ffmpeg
        dev-qt/qtopengl:4"
#	dev-util/nvidia-cuda-toolkit"

RDEPEND=""

S="${WORKDIR}"

src_configure() {
	qmake INSTALL_PREFIX=/usr
}

src_install() {
	emake INSTALL_ROOT="${D}" install || die
}
