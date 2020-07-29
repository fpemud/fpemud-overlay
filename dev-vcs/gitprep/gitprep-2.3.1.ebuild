# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit perl-module user

if [[ ${PV} == "9999" ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/yuki-kimoto/${PN}.git"
	KEYWORDS=""
else
	SRC_URI="https://github.com/yuki-kimoto/${PN}/archive/v${PV}.tar.gz -> ${PF}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

DESCRIPTION="Github clone. You can install Github system into your unix/linux machine"
HOMEPAGE="http://gitprep.yukikimoto.com"
LICENSE="|| ( Artistic GPL-1+ )"
IUSE=""
SLOT="0"

RESTRICT="test"

RDEPEND="dev-lang/perl
	dev-perl/Config-Tiny
	dev-perl/Data-Page
	dev-perl/DBD-SQLite
	dev-perl/DBI
	dev-perl/DBIx-Connector
	dev-perl/DBIx-Custom
	dev-perl/Mojolicious
	dev-perl/Mojolicious-Plugin-AutoRoute
	dev-perl/Mojolicious-Plugin-BasicAuth
	dev-perl/Mojolicious-Plugin-DBViewer
	dev-perl/Mojolicious-Plugin-INIConfig
	dev-perl/Object-Simple
	dev-perl/Text-Markdown-Hoedown
	dev-perl/Time-Moment
	dev-perl/Validator-Custom
	dev-vcs/git
	virtual/perl-Time-HiRes"

DEPEND="${RDEPEND}"

pkg_setup() {
	enewgroup git
	enewuser gitprep -1 -1 "/var/lib/${PN}" git
}

src_prepare() {
	sedargs=(-e '/use lib "$FindBin::Bin.*extlib.*perl/d')
	sed -i "${sedargs[@]}" script/{gitprep-shell-raw,import_rep} setup_database
}

src_install() {
	newinitd "${FILESDIR}"/gitprep.init gitprep

	dodir "/var/lib/${PN}"

	exeinto "/var/lib/${PN}"
	doexe setup_database

	exeinto "/var/lib/${PN}/script"
	doexe script/*

	insinto "/var/lib/${PN}"
	doins -r data lib lock public templates tmp "${PN}.conf" "${PN}_01.png"

	dodir "/var/log/${PN}"
	dosym "../../log/${PN}" "/var/lib/${PN}/log"

	fowners -R gitprep:git "/var/lib/${PN}"
	fowners -R gitprep:git "/var/log/${PN}"
}
