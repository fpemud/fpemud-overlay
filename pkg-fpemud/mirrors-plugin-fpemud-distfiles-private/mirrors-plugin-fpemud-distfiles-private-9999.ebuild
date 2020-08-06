# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="7"

inherit git-r3

EGIT_REPO_URI="https://github.com/fpemud/mirrors-plugin-fpemud-distfiles-private.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="Mirrors plugin for hosting fpemud's private gentoo distfiles"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/mirrors"
DEPEND=""
