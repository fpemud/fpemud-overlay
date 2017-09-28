# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# inherit lists eclasses to inherit functions from. Almost all ebuilds should
# inherit eutils, as a large amount of important functionality has been
# moved there. For example, the epatch call mentioned below wont work
# without the following line:
inherit eutils
# A well-used example of an eclass function that needs eutils is epatch. If
# your source needs patches applied, it's suggested to put your patch in the
# 'files' directory and use:
#
#   epatch "${FILESDIR}"/patch-name-here
#
# eclasses tend to list descriptions of how to use their functions properly.
# take a look at /usr/portage/eclass/ for more examples.

DESCRIPTION="Linuxtrack is head tracking software for webcams, Wii Remotes, and TrackIR versions 2 through 5."
HOMEPAGE="http://code.google.com/p/linux-track/"
SRC_URI="http://linuxtrack.eu/repositories/universal/${P}.tar.bz2"
# SVN is here: http://code.google.com/p/linux-track/source/checkout
LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"

# Likely need to create USE Flags for for the following options:
#   X = ltr_pipe does not require X or QT to run, but initilization of
#       TrackIR or using ltr_gui requires QT! (ie. firmware
#		extracting using Wine from TrackIR Windows .EXE files)
#       For now, I'll omit this as most everybody using this package
#       will require initializing the device.  Once imported, we can
#       later finesse the Ebuild, providing CLI firmware extraction and
#		default config files for devices, omittting having to use QT
#		libraries.
#	xplane = build XPlane plugin (requires XPlane SDK)
#            Create new USE Flag.
#   wine = build wine plugin (requires winegcc, wineg++ and makensis)
#          Create new USE Flag.
#	mickey = Build mickey (virtual mouse) [default=no]
#            Create new USE Flag.
#   32bit = Build 32bit linuxtrack library on 64bit host
#           Create new USE Flag.
#IUSE="X qt"

#RESTRICT="strip"


# Build-time dependencies, such as
#    ssl? ( >=dev-libs/openssl-0.9.6b )
#    >=dev-lang/perl-5.6.1-r1
# It is advisable to use the >= syntax show above, to reflect what you
# had installed on your system when you tested the package.  Then
# other users hopefully won't be caught without the right version of
# a dependency.

# NOTE: mini-xml & qtgui were missing build deps within the configure
# script as of SVN 2013.10.24 required for building the ltr_gui and
# will likely be fixed within >linuxtrack-0.99.6. Without these, the
# compile process silently passes over ltr_gui compile errors and
# and omits building or installing ltr_gui.

# Require build dep libusb & gobjc? DONE, DEFAULT!
# TODO: If USE qt4, then require mini-xml & qtgui.  Required by default for now.
# TODO: If USE wiiremote? then require libcwiid for building
# TODO: If USE webcam, then require libv4l for building
# TODO: If USE opencv (facetracking), then require opencv for building
# TODO: If USE xplane, then require XPlane SDK for building
DEPEND=">=dev-libs/libusbx-1.0.9 \
		>=dev-libs/mini-xml-2.7 \
		>=dev-qt/qtgui-4.8.4-r1"

# Wine is a run-time dep for extracting the firmware from the TrackIR
# Windows EXE software.  Once the firmware is copied into the system
# libraries, likely Wine is no longer needed.
# If USE wine (for firmware extracting), then require runtime wine.
RDEPEND="${DEPEND} \
	>=virtual/wine-1.6"

