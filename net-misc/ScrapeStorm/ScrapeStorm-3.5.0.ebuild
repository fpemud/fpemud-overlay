# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="AI-Powered Visual Web Scraping Tool"
HOMEPAGE="https://www.scrapestorm.com/"
SRC_URI="https://scrapestorm2.azureedge.net/update/en/nature/${PN}-${PV}.AppImage"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}"

src_unpack() {
	return
}

src_install() {
	dodir /opt/ScrapeStorm
	cp ${DISTDIR}/${PN}-${PV}.AppImage ${D}/opt/ScrapeStorm
	chmod 0755 ${D}/opt/ScrapeStorm/${PN}-${PV}.AppImage

	dodir /opt/bin
	dosym ../ScrapeStorm/${PN}-${PV}.AppImage /opt/bin/${PN}-${PV}.AppImage
}
