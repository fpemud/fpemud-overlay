# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit eutils yarn

DESCRIPTION="An elegant Go board and SGF editor for a more civilized age"
HOMEPAGE="http://sabaki.yichuanshen.de/"
LICENSE="MIT"
SLOT="0"

ELECTRON_VERSION="9.3.2"
ELECTRON_SLOT="${ELECTRON_VERSION%%[.+]*}"

YARN_PKGS="
"

if [[ ${PV} == "9999" ]]; then
	inherit "git-r3"
	EGIT_REPO_URI="https://github.com/SabakiHQ/Sabaki.git"
	EGIT_BRANCH="develop"
else
	SRC_URI="https://github.com/SabakiHQ/Sabaki/archive/v${PV}.tar.gz -> ${P}.tar.gz
	         $(yarn_uris ${YARNPKGS})"
	KEYWORDS="~amd64 ~x86"
fi

DEPEND="sys-apps/yarn"
RDEPEND="dev-util/electron"

DESTPATH="opt/${PN}"


QA_PREBUILT="
	${DESTPATH}/libffmpeg.so
	${DESTPATH}/libnode.so
	${DESTPATH}/${PN}
"

# capitalize first letter
S=${WORKDIR}/${PN^}-${PV}


src_prepare() {
	default

	export PATH="/usr/$(get_libdir)/node_modules/npm/bin/node-gyp-bin:${PATH}"
	# https://github.com/joaomoreno/gulp-atom-electron/blob/v1.22.0/src/download.js#L16
	local electron_cache_path="${TMPDIR}/gulp-electron-cache/atom/electron/"
	mkdir -p "${electron_cache_path}"

	# Build native modules for system electron
	local electron_version="$(get_local_electron_version)"
	local electron_zip="$(get_electron_prebuilt_zip_name ${electron_version})"
                einfo "Build against Electron ${electron_version}"
                sed -i "s/^target .*/target \"${electron_version//v/}\"/" "${S}"/.yarnrc

                # use local electron node headers
                echo "nodedir $(get_electron_nodedir)" >>${S}/.yarnrc
                echo "nodedir /usr/include/node/" >>${S}/remote/.yarnrc

                einfo "making a ${electron_zip} from local electron"
                pushd "$(get_electron_dir)" >/dev/null || die
                zip -0yr "${electron_cache_path}/${electron_zip}" * \
                        --exclude="chrome-sandbox" --exclude="chromedriver" --exclude="mksnapshot" \
                        --exclude="npm/*" --exclude="resources/*"
                popd >/dev/null || die





	yarn install || die "yarn module installation failed"
}


src_compile() {
	yarn run build || die "build failed"
}


src_install() {
	pushd ${S}/dist/linux-unpacked
	insinto ${DESTPATH}
	exeinto ${DESTPATH}
	dodoc LICENSE*
	doins -r locales resources
	doins *.{pak,bin,dat}
	doins *.so
	doexe ${PN}
	popd

	dosym ../../${DESTPATH}/${PN} usr/bin/${PN}
}

get_electron_dir() {
	echo "/usr/$(get_libdir)/electron-${ELECTRON_SLOT}"
}

get_local_electron_version() {
	echo "$(<$(get_electron_dir)/version)"
}

