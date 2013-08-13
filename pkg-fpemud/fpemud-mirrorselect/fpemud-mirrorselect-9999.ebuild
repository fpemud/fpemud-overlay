# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
  EGIT_REPO_URI="git://github.com/fpemud/fpemud-mirrorselect.git"
  inherit git-2
  SRC_URI=""
  KEYWORDS="-* amd64 x86"
else
  die "Invalid version"
fi

DESCRIPTION="Mirror selection script for fpemud system"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-portage/mirrorselect"
DEPEND="${RDEPEND}"

src_install() {
  dobin "fpemud-mirrorselect"
}

