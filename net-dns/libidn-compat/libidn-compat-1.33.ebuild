# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# this ebuild is only for the libidn.so.11 SONAME for ABI compat

inherit autotools multilib-minimal libtool

MY_P="libidn-${PV}"
DESCRIPTION="Internationalized Domain Names (IDN) implementation"
HOMEPAGE="https://www.gnu.org/software/libidn/"
SRC_URI="mirror://gnu/libidn/${MY_P}.tar.gz
	https://dev.gentoo.org/~polynomial-c/${MY_P}-security_backports-01.tar.xz
"
S="${WORKDIR}/${MY_P}"

LICENSE="GPL-2 GPL-3 LGPL-3"
SLOT="0/11"
KEYWORDS="alpha amd64 arm arm64 hppa ia64 m68k ~mips ppc ppc64 s390 sh ~sparc x86 ~x64-cygwin ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~m68k-mint ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"

RDEPEND="!=${CATEGORY}/libidn-1.33*"

PATCHES=(
	"${FILESDIR}"/libidn-1.33-parallel-make.patch
)

src_prepare() {
	default

	eapply "${WORKDIR}"/patches

	# breaks eautoreconf
	sed '/AM_INIT_AUTOMAKE/s@ -Werror@@' -i configure.ac || die
	# Breaks build because --disable-gtk-doc* gets ignored
	sed '/^SUBDIRS/s@ doc@@' -i Makefile.am || die
	eautoreconf
	elibtoolize  # for Solaris shared objects
}

multilib_src_configure() {
	local myeconfargs=(
		--disable-java
		--disable-csharp
		--disable-nls
		--disable-static
		--disable-silent-rules
		--disable-valgrind-tests
		--with-packager-bug-reports="https://bugs.gentoo.org"
		--with-packager-version="r${PR}"
		--with-packager="Gentoo"
	)
	ECONF_SOURCE="${S}" econf "${myeconfargs[@]}"
}

multilib_src_test() {
	# only run libidn specific tests and not gnulib tests (bug #539356)
	emake -C tests check
}

multilib_src_install() {
	dolib.so lib/.libs/libidn.so.11*
}
