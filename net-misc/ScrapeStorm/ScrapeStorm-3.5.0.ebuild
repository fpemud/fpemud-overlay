# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI="7"

DESCRIPTION="AI-Powered Visual Web Scraping Tool"
HOMEPAGE="https://www.scrapestorm.com/"
SRC_URI="https://scrapestorm2.azureedge.net/update/en/nature/${PN}-${PV.AppImage"
LICENSE="unknown"
SLOT="0"
KEYWORDS="-* amd64 x86"
IUSE=""
RESTRICT=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${PN}"

src_unpack() {
	local _file

	for _file in ${A}; do
		if [[ "${_file}" == rarli* ]]; then
			if [[ "${_file}" =~ x64 ]]; then
				if ! use amd64; then
					continue
				fi

				unpack "${_file}"
			elif [[ ! "${_file}" =~ x64 ]]; then
				if ! use x86; then
					continue
				fi

				unpack "${_file}"
			else
				die "Unknown SRC file '${_file}'!"
			fi
		fi
	done

	rm -f "${S}"/license.txt

	if use all_sfx ; then
		mkdir sfx
		cd sfx
		for _file in ${A}; do
			if [[ "${_file}" == rarli* ]]; then
				unpack "${_file}"
				if [[ "${_file}" =~ x64 ]]; then
					mv rar/default.sfx default-elf64.sfx || die
				else
					mv rar/default.sfx default-elf32.sfx || die
				fi
			elif [[ "${_file}" == winrar* ]]; then
				ln -s "${DISTDIR}"/${_file} w64.rar || die
				unpack ./w64.rar
				mv Default.SFX default-win32.sfx || die
				mv Default64.SFX default-win64.sfx || die
			else
				die "Unknown SFX file '${_file}'!"
			fi
		done
	fi
}

src_compile() { :; }

src_install() {
	exeinto /opt/rar
	doexe rar unrar

	dodir /opt/bin
	dosym ../rar/rar /opt/bin/rar
	dosym ../rar/unrar /opt/bin/unrar

	insinto /opt/rar
	if use all_sfx ; then
		doins "${WORKDIR}"/sfx/*.{sfx,SFX}
	else
		doins default.sfx
	fi
	doins rarfiles.lst
	dodoc *.txt
}
