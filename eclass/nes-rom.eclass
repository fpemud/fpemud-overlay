# @ECLASS: nes-rom.eclass
# @MAINTAINER:
# Fpemud <fpemud@sina.com>
# @BLURB: Eclass to install NES roms
# @DESCRIPTION:
# This eclass simplifies installing NES roms

EXPORT_FUNCTIONS src_install

# @ECLASS-VARIABLE: EROM_NAME
# @REQUIRED
# @DESCRIPTION:
# Name for this ROM
#
# Example:
# @CODE
# EROM_NAME="Contra"
# @CODE

# @ECLASS-VARIABLE: EROM_SITE
# @DESCRIPTION:
# Website from which this ROM can be downloaded.
# Valid values are: "romhustler.org", "romsmania.cc"
#
# Example:
# @CODE
# EROM_SITE="romhustler.org"
# @CODE

# @ECLASS-VARIABLE: EROM_ID
# @DESCRIPTION:
# Identifier for this ROM. Required if EROM_SITE is specified.
#
# Example:
# @CODE
# EROM_ID="contra"
# @CODE

# @ECLASS-VARIABLE: EROM_MAIN_FILE
# @DESCRIPTION:
# The main ROM file if there's multiple variants of this ROM
#
# Example:
# @CODE
# EROM_MAIN_FILE="Contra (U) [o5].nes"
# @CODE

DESCRIPTION="Nintendo (NES) ROM - ${EROM_NAME}"
if [[ "$EROM_SITE" == "romhustler.org" ]] ; then
	HOMEPAGE="https://${EROM_SITE}/rom/nes/${EROM_ID}"
elif [[ "$EROM_SITE" == "romsmania.cc" ]] ; then
	HOMEPAGE="https://${EROM_SITE}/roms/nintendo/${EROM_ID}"
elif [[ ! -x "$EROM_SITE" ]] ; then
	die "Invalid \$EROM_SITE specified"
fi

SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""
RESTRICT="mirror"

S="${WORKDIR}"

# @FUNCTION: nes-rom_pkg_setup
# @DESCRIPTION: Install ROM files
nes-rom_src_install() {
	count_file=`ls -1 ${WORKDIR}/*.nes 2>/dev/null | wc -l`
	if [ -z "${EROM_MAIN_FILE}" ] ; then
		[[ $count_file != 1 ]] && die "No \$EROM_MAIN_FILE specified when there're multiple ROM files"
		EROM_MAIN_FILE=`ls ${WORKDIR}/*.nes`
	else
		[ -e "${WORKDIR}/${EROM_MAIN_FILE}" ] || die "\$EROM_MAIN_FILE not found"
	fi
	insinto /opt/nes-roms/${PN}
	doins *.nes
	ln -sf "${PN}/${EROM_MAIN_FILE}" "${D}/opt/nes-roms/${PN}.nes"
}
