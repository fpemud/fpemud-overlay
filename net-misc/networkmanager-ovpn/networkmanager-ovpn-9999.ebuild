# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
GCONF_DEBUG="no"
GNOME_ORG_MODULE="NetworkManager-${PN##*-}"

inherit eutils gnome2 user git-2

DESCRIPTION="NetworkManager VPN integration for OpenVPN using ovpn file directly"
HOMEPAGE="https://github.com/fpemud/networkmanager-ovpn"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/networkmanager-ovpn.git"
EGIT_BRANCH="release"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="amd64 ~arm x86"
IUSE="test"

RDEPEND="
	>=dev-libs/dbus-glib-0.74
	>=dev-libs/glib-2.32:2
	>=net-misc/networkmanager-0.9.10:=
	>=net-vpn/openvpn-2.1_rc9
"
DEPEND="${RDEPEND}
	sys-devel/gettext
	>=dev-util/intltool-0.35
	virtual/pkgconfig
"

pkg_setup() {
	enewgroup nm-openvpn
	enewuser nm-openvpn -1 -1 -1 nm-openvpn
}

src_configure() {
	# --localstatedir=/var needed per bug #536248
	gnome2_src_configure \
		--localstatedir=/var \
		--disable-more-warnings \
		--disable-static \
		--with-dist-version=Gentoo \
		$(use_with test tests)
}
