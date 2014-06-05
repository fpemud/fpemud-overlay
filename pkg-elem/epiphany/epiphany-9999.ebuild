# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

#EGIT_REPO_URI="git://github.com/fpemud/fpemud-portage.git"
#inherit git-2
SRC_URI=""
KEYWORDS="-* amd64 x86"
DESCRIPTION="Web site viewer for Element Desktop"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-libs/webkit-gtk"
DEPEND="${RDEPEND}"

pkg_postrm() {
	find "${EROOT}/usr/bin/epiphany" -name "*.pyc" | xargs rm -f

	# Delete empty parent directories.
	local dir="${EROOT}/usr/bin/epiphany"
	while [[ "${dir}" != "${EROOT%/}" ]]; do
		rmdir "${dir}" 2> /dev/null || break
		dir="${dir%/*}"
	done
}
