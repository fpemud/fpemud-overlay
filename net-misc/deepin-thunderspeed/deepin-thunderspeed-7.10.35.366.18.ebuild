# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker versionator

DESCRIPTION="ThunderSpeed for Linux by Deepin"
HOMEPAGE="https://www.deepin.org"

COMMON_URI="http://packages.deepin.com/deepin/pool/non-free/d"
MY_PN="deepin.com.thunderspeed"
MY_PV=$(replace_version_separator 4 'deepin' )

SRC_URI="${COMMON_URI}/${MY_PN}/${MY_PN}_${MY_PV}_i386.deb"

LICENSE="Thunder"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="virtual/wine"

S=${WORKDIR}

src_prepare() {
	eapply_user

	# Prepare data files
	mv "${WORKDIR}/opt/deepinwine/apps/Deepin-ThunderSpeed" "${WORKDIR}/opt/${PN}"
	rm -rf "${WORKDIR}/opt/deepinwine"

	# Prepare desktop file
	sed -i -e "/^X-Created-By=/d" \
	       -e "s/^Categories=.*$/Categories=Internet;/g" \
	       -e "s/^Exec=.*$/Exec=thunderspeed/g" "${WORKDIR}/usr/share/applications/deepin.com.thunderspeed.desktop"

	# Prepare the wrapper script
	sed -e "s/^APPDIR=.*$/APPDIR=\/opt\/${PN}/g" \
	    -e "s/^DATADIR=.*$/DATADIR=~\/.cache\/${PN}/g" \
	    -e "s/^CFGDIR=.*$/CFGDIR=~\/.config\/${PN}/g" "${FILESDIR}/thunderspeed" > "${WORKDIR}/thunderspeed"
}

src_install() {
	insinto /
	doins -r opt usr

	dobin thunderspeed
}
