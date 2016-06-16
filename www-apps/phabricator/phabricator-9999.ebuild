# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
WEBAPP_NO_AUTO_INSTALL=yes
inherit git-r3 webapp

DESCRIPTION="Collection of web applications which makes it easier to scale software companies"
HOMEPAGE="http://phabricator.org"
EGIT_REPO_URI="git://github.com/facebook/phabricator.git"

LICENSE="Apache-2.0"
KEYWORDS="~x86 ~amd64"
IUSE="git highlight mail mercurial subversion ssl test"
REQUIRED_USE="test? ( git mercurial subversion )"

DEPEND="virtual/awk:0
	test? (
		=www-client/arcanist-${PV}:0[test]
	)"
RDEPEND=">=app-admin/webapp-config-1.51-r1:0
	|| (
		>=www-servers/apache-2.2.7:2[apache2_modules_rewrite]
		www-servers/nginx:0
		www-servers/lighttpd:0
	)
	app-misc/jq:0
	>=dev-lang/php-5.2.3[cli,curl,gd,iconv,json,mysql,mysqli,pcntl,ssl?,unicode]
	virtual/mysql
	=dev-php/libphutil-${PV}:0
	net-libs/nodejs:0
	=www-client/arcanist-${PV}:0[git?,mercurial?,subversion?]
	git? ( dev-vcs/git:0 )
	mercurial? ( dev-vcs/mercurial:0 )
	subversion? ( dev-vcs/subversion:0 )
	highlight? ( dev-python/pygments:0 )
	mail? ( dev-php/pecl-mailparse:0 )"

pkg_setup() {
	webapp_pkg_setup

	if use test ; then
		einfo "Environnement variables you can tweak for database tests"
		einfo "  PHABRICATOR_MYSQL_HOST (default my.cnf[client].host || my.cnf[client].socket)"
		einfo "  PHABRICATOR_MYSQL_USER (default my.cnf[client].user || current user)"
		einfo "  PHABRICATOR_MYSQL_PASS (default my.cnf[client].password || empty)"
		einfo
		einfo "src_test() may fail if such variable are not defined"
	fi
}

src_prepare() {
	#epatch "${FILESDIR}/0001-Make-wiki-visible-to-all.patch"

	find -type f -name .gitignore -print0 \
		| xargs -0 --no-run-if-empty -- \
			rm

	rm -r scripts/install

	# Replace 'env' shebang to files it point to
	find -type f \
		| sort \
		| xargs -n 1 --no-run-if-empty -- \
			awk 'NR == 1 && /^#!\/usr\/bin\/env/ {print FILENAME}' \
		| while read ; do
			set -- $(sed -ne '1 s:^#!\([^ ]*\) ::p;q' ${REPLY})
			cmd="$1" ; shift ; args="$@"

			case "${cmd}" in
				bash|php)	;;
				*)			continue ;;
			esac

			path="$(type -p ${cmd})" || continue
			[[ -z "${path}" ]] && continue

			einfo "Changing ${REPLY} shebang to #!${path} ${args}"
			sed -i \
				-e "1 s:^#!.*:#!${path} ${args}:" \
				"${REPLY}"
			eend $?
		done
}

src_test() {
	local BASE_URI="http://localhost.localdomain"
	einfo "Setting phabricator.base-uri='${BASE_URI}'"
	bin/config set phabricator.base-uri "${BASE_URI}"

	if [[ -n "${PHABRICATOR_MYSQL_HOST}" ]] ; then
		einfo "Setting mysql.host='${PHABRICATOR_MYSQL_HOST}'"
		bin/config set mysql.host "${PHABRICATOR_MYSQL_HOST}"
		eend $?
	fi

	if [[ -n "${PHABRICATOR_MYSQL_USER}" ]] ; then
		einfo "Setting mysql.user='${PHABRICATOR_MYSQL_USER}'"
		bin/config set mysql.user "${PHABRICATOR_MYSQL_USER}"
		eend $?
	fi

	if [[ -n "${PHABRICATOR_MYSQL_PASS}" ]] ; then
		einfo "Setting mysql.pass='${PHABRICATOR_MYSQL_PASS}'"
		bin/config set mysql.pass "${PHABRICATOR_MYSQL_PASS}"
		eend $?
	fi

	arc unit --everything --no-coverage || die "arc unit failed"

	# Cleanup tests only config files
	rm conf/local/local.json
}

src_install() {
	webapp_src_preinst

	# All directories must be private (ie accessible in hostroot),
	# expect webroot that will become htdocs
	insinto "${MY_HOSTROOTDIR}"
	doins -r bin conf externals resources scripts src support

	# All files and directories present in webroot/ will be
	# installed in htdocs
	insinto "${MY_HTDOCSDIR}"
	doins -r webroot/*

	newins "${FILESDIR}/htaccess" .htaccess

	# Make executable all shebanged files
	find "${ED}" -type f \
		| xargs -n 1 --no-run-if-empty -- \
			awk 'NR == 1 && /^#!/ {print FILENAME}' \
		| sed -e "s:${ED}:/:" \
		| xargs --no-run-if-empty -- \
			fperms 755

	webapp_configfile "${MY_HTDOCSDIR}/.htaccess"
	webapp_hook_script "${FILESDIR}/webapp-hook"

	webapp_src_install

	newinitd "${FILESDIR}/phd.initd" phd
	newconfd "${FILESDIR}/phd.confd" phd

	newinitd "${FILESDIR}/aphlictd.initd" aphlictd
	newconfd "${FILESDIR}/aphlictd.confd" aphlictd

	dodoc NOTICE README.md
}

pkg_postinst() {
	webapp_pkg_postinst

	elog
	elog "For more info about how to configure, see"
	elog "	http://www.phabricator.com/docs/phabricator/article/Configuration_Guide.html"
}
