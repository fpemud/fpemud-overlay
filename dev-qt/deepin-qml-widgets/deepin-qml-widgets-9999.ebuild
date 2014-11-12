# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v3
# $Header: $

EAPI=5

inherit git-2 eutils qmake-utils

DESCRIPTION="Deepin Qml Widgets"
HOMEPAGE="https://github.com/linuxdeepin/deepin-qml-widgets"
EGIT_REPO_URI="http://github.com/linuxdeepin/deepin-qml-widgets.git"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-qt/qtcore:5
         dev-qt/qtx11extras:5"
DEPEND="${RDEPEND}"

src_configure() {
	eqmake5
}

