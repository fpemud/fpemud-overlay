# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

DESCRIPTION="Fpemud's box server"
EGIT_REPO_URI="https://coding.net/fpemud/fpemud-boxserver.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="app-emulation/qemu
         dev-python/python-qemu-qmp
         app-emulation/virt-service"
DEPEND=""
