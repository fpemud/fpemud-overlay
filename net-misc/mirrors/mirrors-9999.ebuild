# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-2

EGIT_REPO_URI="https://github.com/fpemud/mirrors.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="--fixme"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/croniter"
RDEPEND="$RDEPEND app-arch/p7zip sys-apps/file[python]"		# driveoff-drivepack
RDEPEND="$RDEPEND dev-vcs/repo"			# aosp
DEPEND=""
