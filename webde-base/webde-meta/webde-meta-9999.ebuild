# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="6"

DESCRIPTION="Meta ebuild for WebDE, the Web Desktop Environment"
HOMEPAGE="http://webde.org/"

LICENSE="metapackage"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ppc ~x86"
IUSE=""

RDEPEND=">=webde-base/webde-core
         >=webde-base/webde-desktop
         >=webde-base/webde-terminal"
