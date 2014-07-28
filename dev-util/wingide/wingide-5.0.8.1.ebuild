# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

inherit eutils multilib-minimal rpm versionator

MY_PV=$(replace_version_separator 3 '-')
MY_PV1=${PV%.*}		# eg: 5.0.8
MY_PV2=${PV%.*.*}	# eg: 5.0
MY_PV3=${PV%.*.*.*}	# eg: 5

DESCRIPTION="Wing IDE is advanced Python IDE."
HOMEPAGE="http://www.wingide.com"
SRC_URI="x86? ( http://wingware.com/pub/wingide/${MY_PV1}/wingide${MY_PV3}-${MY_PV}.i386.rpm )
         amd64? ( http://wingware.com/pub/wingide/${MY_PV1}/wingide${MY_PV3}-${MY_PV}.x86_64.rpm )"

LICENSE="WingIDE"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=dev-lang/python-2.0.0"

S=${WORKDIR}
WINGHOME="/opt/wingide"

src_unpack () {
	rpm_src_unpack ${A}
	sed -i -e "s:/usr/lib/wingide${MY_PV3}:${WINGHOME}:g" usr/lib/wingide${MY_PV3}/wing || die
}

src_compile() {
	echo "Nothing to compile."
}

src_install() {
	dodir ${WINGHOME}
	cp -R ${WORKDIR}/usr/lib/wingide${MY_PV3}/* ${D}/${WINGHOME}/ || die "Install failed!"
	dosym ${WINGHOME}/wing /usr/bin/wingide

	cat > wingide.desktop <<-EOF
		[Desktop Entry]
		Version=${PV}
		Type=Application
		Name=WingIDE
		Comment=Wing IDE - advanced Python IDE
		Exec=wingide
		Icon=wingide.png
		Categories=Application;Development;
		MimeType=application/x-python;
	EOF

	for res in 16 32 48 64 128; do
		insinto /usr/share/icons/hicolor/${res}x${res}/apps/
		newins "${WORKDIR}"/usr/lib/wingide${MY_PV3}/resources/wing${res}.png wingide.png
	done

	insinto /usr/share/applications/
	doins wingide.desktop

}

pkg_postinst() {
	einfo ""
	einfo "To run Wing IDE Professional use wingide command"
	einfo ""
	einfo "To install fixes from Wing\`s developers run wingide under root"
	einfo "and select in menu Help-Check for updates"
	einfo ""
}
