# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

DESCRIPTION="A speech recognizer written entirely in the Java programming language: Extra Data"
HOMEPAGE="http://cmusphinx.sourceforge.net/"
SRC_URI="http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Kazakh/kz-0.1.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/French/cmusphinx-fr-ptm-5.2.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/French/cmusphinx-fr-5.2.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/French%20Language%20Model/fr-phone.lm.dmp
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/French%20Language%20Model/french3g62K.lm.dmp
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/French%20Language%20Model/frenchWords62K.dic
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Russian/zero_ru_cont_8k_v3.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20Generic%20Acoustic%20Model/cmusphinx-en-us-ptm-8khz-5.2.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20Generic%20Acoustic%20Model/cmusphinx-en-us-5.2.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20Generic%20Acoustic%20Model/cmusphinx-en-us-ptm-5.2.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20Generic%20Language%20Model/cmusphinx-5.0-en-us.lm.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/US%20English%20Generic%20Language%20Model/cmusphinx-5.0-en-us.lm.dmp
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Spanish%20Voxforge/voxforge-es-0.2.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Mexican%20Spanish%20Broadcast%20News/es_MX_broadcast_cont_2500.tar.bz2
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/German%20Voxforge/voxforge-de-0.1.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Dutch%20Voxforge/voxforge-nl-0.1.tar.gz
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Mandarin%20Language%20Model/zh_broadcastnews_64000_utf8.DMP
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Mandarin%20Language%20Model/zh_broadcastnews_utf8.dic
         http://sourceforge.net/projects/cmusphinx/files/Acoustic%20and%20Language%20Models/Mandarin%20Broadcast%20News%20acoustic%20models/zh_broadcastnews_16k_ptm256_8000.tar.bz2"

LICENSE="GPL-2"
KEYWORDS="~amd64"
SLOT="0"

RDEPEND=""
DEPEND=""

src_install() {
	mkdir -p ${D}/usr/share/sphinx4-data-extra
	tar -xjf ${DISTFILES}/kz-0.1.tar.gz

	return
}
