# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6
PYTHON_COMPAT=( python{2_7,3_4,3_5,3_6,3_7} )

inherit distutils-r1 git-r3

DESCRIPTION="A Python wrapper for Google Tesseract"
HOMEPAGE="https://github.com/madmaze/pytesseract"
EGIT_REPO_URI="https://github.com/madmaze/pytesseract"

LICENSE="GPLv3"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86 ~amd64-linux ~x86-linux"
IUSE=""

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="app-text/tesseract
         dev-python/pillow"
