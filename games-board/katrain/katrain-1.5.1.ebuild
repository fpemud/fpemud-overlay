# automatically generated by g-sorcery
# please do not edit this file

EAPI=7
PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1

DESCRIPTION="Improve your Baduk skills by training with KataGo!"
SRC_URI="https://github.com/sanderland/katrain/archive/v${PV}.tar.gz"

HOMEPAGE="https://github.com/sanderland/katrain"
LICENSE="unknown"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/kivy[${PYTHON_USEDEP}]
         dev-python/kivymd[${PYTHON_USEDEP}]"
