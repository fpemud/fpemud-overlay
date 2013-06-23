# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

if [[ ${PV} == "9999" ]] ; then
	EGIT_REPO_URI="git://github.com/fpemud/virt-service.git"
	inherit git-2
	SRC_URI=""
	KEYWORDS="-* amd64 x86"
else
	die "Invalid version"
fi

DESCRIPTION="A simple virtual machine dbus service provider"

LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="net-misc/bridge-utils
         net-misc/openvpn
         >=sys-apps/iproute2-2.6.34"
DEPEND=""

#pkg_postrm() {  
#	find "${EROOT}/usr/share/virt-player" -name "*.pyc" | xargs rm -f
#
#	# Delete empty parent directories.
#	local dir="${EROOT}/usr/share/virt-player"
#	while [[ "${dir}" != "${EROOT%/}" ]]; do
#		rmdir "${dir}" 2> /dev/null || break
#		dir="${dir%/*}"
#	done
#}

