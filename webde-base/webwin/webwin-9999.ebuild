# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit git-r3

DESCRIPTION="Main server for Web Desktop Environment"
SRC_URI=""
EGIT_REPO_URI="https://github.com/fpemud/webwin"

KEYWORDS="-* amd64 x86"
LICENSE="GPL-3"
SLOT="0"
IUSE=""

RDEPEND="www-servers/nginx[nginx_modules_http_auth_pam]
         dev-python/cherrypy"
