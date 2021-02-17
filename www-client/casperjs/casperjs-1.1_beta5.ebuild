# Copyright 2013 gg7
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

EGIT_REPO_URI="git://github.com/n1k0/${PN}.git"
EGIT_COMMIT="1.1-beta5"
inherit git-r3

DESCRIPTION="Navigation scripting & testing utility written in Javascript and based on PhantomJS"
HOMEPAGE="http://casperjs.org/"
SRC_URI=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="doc examples mono mono_compile +python test"
REQUIRED_USE="|| ( mono python ) mono_compile? ( mono )"

RDEPEND="|| ( >=www-client/phantomjs-1.8.2 >=www-client/phantomjs-bin-1.8.2 )
         mono? ( >=dev-lang/mono-2.10.8 )
         python? ( >=dev-lang/python-2.6 )
"
DEPEND="${RDEPEND}
        doc? ( dev-python/sphinx )
        test? ( >=dev-lang/python-2.6 )
"

src_compile() {
	if use doc; then
		einfo "Generating documentation"
		pushd docs > /dev/null
		emake build
		popd > /dev/null
	fi
}

src_install() {
	insinto ${EROOT}usr/share/${PF}
	doins -r modules
	doins package.json

	insinto ${EROOT}usr/share/${PF}/bin
	doins bin/bootstrap.js

	exeinto ${EROOT}/usr/share/${PF}/bin
	if use python; then
		doexe "bin/casperjs"
		dosym "${EROOT}usr/share/${PF}/bin/casperjs" "${EROOT}usr/bin/casperjs"
	fi
	if use mono; then
		if use mono_compile; then
			rm bin/casperjs.exe || die
			mcs -langversion:3 -out:bin/casperjs.exe src/casperjs.cs || die "mono compilation failed"
		fi
		doexe "bin/casperjs.exe"
		dosym "${EROOT}usr/share/${PF}/bin/casperjs.exe" "${EROOT}usr/bin/casperjs.exe"
	fi

	if use doc; then
		docinto doc
		dodoc bin/usage.txt CHANGELOG.md CONTRIBUTORS.md LICENSE.md README.md
		dohtml -A txt -r docs/_build/*
	fi

	if use examples; then
		docinto examples
		dodoc samples/*
	fi
}

src_test() {
	einfo "Running CLI tests with Python"
	python ./tests/clitests/runtests.py

	if use python; then
		einfo "Running selftest with Python"
		./bin/casperjs selftest
	else
		einfo "Running selftest with Mono"
		mono ./bin/casperjs.exe selftest
	fi
}
