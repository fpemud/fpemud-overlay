# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

# this ebuild is only for the librtmp.so.0 SONAME for ABI compat

inherit multilib toolchain-funcs multilib-minimal flag-o-matic

MY_PN="rtmpdump"
DESCRIPTION="RTMP client, librtmp library intended to stream audio or video flash content"
HOMEPAGE="https://rtmpdump.mplayerhq.hu/"

LICENSE="LGPL-2.1"
SLOT="0"
IUSE="gnutls ssl libressl"

REQUIRED_USE="?? ( gnutls libressl )"

DEPEND="ssl? (
		gnutls? (
			>=net-libs/gnutls-2.12.23-r6[${MULTILIB_USEDEP},nettle(+)]
			dev-libs/nettle:0=[${MULTILIB_USEDEP}]
		)
		libressl? ( dev-libs/libressl:0=[${MULTILIB_USEDEP}] )
		!gnutls? ( !libressl? ( dev-libs/openssl:0=[${MULTILIB_USEDEP}] ) )
		>=sys-libs/zlib-1.2.8-r1[${MULTILIB_USEDEP}]
	)"
RDEPEND="${DEPEND}"

PATCHES=(
	"${FILESDIR}/${MY_PN}-swf_vertification_type_2.patch"
	"${FILESDIR}/${MY_PN}-swf_vertification_type_2_part_2.patch"
)

KEYWORDS="~amd64 ~arm ~arm64 ~hppa ~mips ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux"
SRC_URI="http://git.ffmpeg.org/gitweb/rtmpdump.git/snapshot/c58cfb3e9208c6e6bc1aa18f1b1d650d799084e5.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${MY_PN}-c58cfb3"

pkg_setup() {
	if ! use ssl; then
		if use gnutls; then
			ewarn "USE='gnutls' is ignored without USE='ssl'."
			ewarn "Please review the local USE flags for this package."
		fi
		if use libressl; then
			ewarn "USE='libressl' is ignored without USE='ssl'."
			ewarn "Please review the local USE flags for this package."
		fi
	fi
}

src_prepare() {
	# fix #571106 by restoring pre-GCC5 inline semantics
	append-cflags -std=gnu89
	# fix Makefile ( bug #298535 , bug #318353 and bug #324513 )
	sed -i -e 's:OPT=:&-fPIC :' \
		-e 's:OPT:OPTS:' \
		-e 's:CFLAGS=.*:& $(OPT):' librtmp/Makefile \
		|| die "failed to fix Makefile"
	use ssl && use !gnutls && use !libressl && eapply "${FILESDIR}/${MY_PN}-openssl-1.1-v2.patch"
	find . -type f -maxdepth 1 | xargs rm -f
	default
	multilib_copy_sources
}

multilib_src_compile() {
	if use ssl ; then
		if use gnutls ; then
			crypto="GNUTLS"
		else
			crypto="OPENSSL"
		fi
	fi
	cd librtmp || die
	emake CC="$(tc-getCC)" LD="$(tc-getLD)" AR="$(tc-getAR)" \
		OPT="${CFLAGS}" XLDFLAGS="${LDFLAGS}" CRYPTO="${crypto}" SYS=posix
}

multilib_src_install() {
	newlib.so librtmp/librtmp.so.0 librtmp.so.0
}
