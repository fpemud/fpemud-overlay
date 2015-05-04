# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit git-2

EGIT_REPO_URI="http://github.com/fpemud/fpemud-usermanager.git"
SRC_URI=""
KEYWORDS="-* amd64 x86"

DESCRIPTION="A simple user management tool"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="dev-python/strict_pgs
         dev-python/passlib"
DEPEND="${RDEPEND}"

pkg_postrm() {
	find "${EROOT}/usr/lib/fpemud-usermanager" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/lib/fpemud-usermanager"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}
