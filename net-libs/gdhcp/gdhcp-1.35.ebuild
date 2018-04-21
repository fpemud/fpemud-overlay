# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit gnome2 multilib-minimal meson

DESCRIPTION="DHCP client library with GLib integration"
HOMEPAGE="https://github.com/fpemud/gdhcp"
SRC_URI="https://github.com/fpemud/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPLv2"
SLOT="0"
KEYWORDS="alpha amd64 arm ~arm64 hppa ~ia64 ~mips ppc ppc64 ~s390 ~sparc x86 ~amd64-fbsd ~x86-fbsd"
IUSE="debug vala +introspection"

RDEPEND="
	>=dev-libs/glib-2.37.6:2[${MULTILIB_USEDEP}]
	introspection? ( >=dev-libs/gobject-introspection-0.9.5:= )
"
DEPEND="${RDEPEND}
	~app-text/docbook-xml-dtd-4.1.2
	app-text/docbook-xsl-stylesheets
	dev-libs/libxslt
	>=dev-util/gtk-doc-am-1.20
	>=sys-devel/gettext-0.18
	virtual/pkgconfig[${MULTILIB_USEDEP}]
"

src_configure() {
        local emesonargs=(
                -Dwith_introspection="$(usex introspection true false)"
                -Dwith_vapi="$(usex vala true false)"
        )
	meson_src_configure
}
