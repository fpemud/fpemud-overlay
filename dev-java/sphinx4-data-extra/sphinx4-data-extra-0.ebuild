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

S=${WORKDIR}

src_unpack() {
	return
}

src_install() {
	PDIR=${D}/usr/share/sphinx4-data-extra

	mkdir -p ${PDIR}

	tar -xzf ${DISTDIR}/kz-0.1.tar.gz -C ${PDIR}

	MYDIR=${PDIR}/en_us-5.2
	mkdir -p ${MYDIR}
	tar -xzf ${DISTDIR}/cmusphinx-en-us-5.2.tar.gz -C ${MYDIR}
	mv ${MYDIR}/cmusphinx-en-us-5.2 ${MYDIR}/etc
	tar -xzf ${DISTDIR}/cmusphinx-en-us-ptm-5.2.tar.gz -C ${MYDIR}
	mv ${MYDIR}/cmusphinx-en-us-ptm-5.2 ${MYDIR}/etc-ptm
	tar -xzf ${DISTDIR}/cmusphinx-en-us-ptm-8khz-5.2.tar.gz -C ${MYDIR}
	mv ${MYDIR}/cmusphinx-en-us-ptm-8khz-5.2 ${MYDIR}/etc-ptm-8khz
	cp ${DISTDIR}/cmusphinx-5.0-en-us.lm.gz ${MYDIR}
	gunzip ${MYDIR}/cmusphinx-5.0-en-us.lm.gz
	cp ${DISTDIR}/cmusphinx-5.0-en-us.lm.dmp ${MYDIR}

	MYDIR=${PDIR}/fr-5.2
	mkdir -p ${MYDIR}
	tar -xzf ${DISTDIR}/cmusphinx-fr-5.2.tar.gz -C ${MYDIR}
	mv ${MYDIR}/cmusphinx-fr-5.2 ${MYDIR}/etc
	tar -xzf ${DISTDIR}/cmusphinx-fr-ptm-5.2.tar.gz -C ${MYDIR}
	mv ${MYDIR}/cmusphinx-fr-ptm-5.2 ${MYDIR}/etc-ptm
	cp ${DISTDIR}/fr-phone.lm.dmp ${MYDIR}
	cp ${DISTDIR}/french3g62K.lm.dmp ${MYDIR}
	cp ${DISTDIR}/frenchWords62K.dic ${MYDIR}

	tar -xzf ${DISTDIR}/voxforge-es-0.2.tar.gz -C ${PDIR}
	tar -xjf ${DISTDIR}/es_MX_broadcast_cont_2500.tar.bz2 -C ${PDIR}

	tar -xzf ${DISTDIR}/voxforge-de-0.1.tar.gz -C ${PDIR}

	tar -xzf ${DISTDIR}/voxforge-nl-0.1.tar.gz -C ${PDIR}

	MYDIR=${PDIR}/zh-broadcastnews
	mkdir -p ${MYDIR}
	tar -xjf ${DISTDIR}/zh_broadcastnews_16k_ptm256_8000.tar.bz2 -C ${MYDIR}
	mv ${MYDIR}/zh_broadcastnews_ptm256_8000 ${MYDIR}/etc-ptm256-8khz
	cp ${DISTDIR}/zh_broadcastnews_64000_utf8.DMP ${MYDIR}
	cp ${DISTDIR}/zh_broadcastnews_utf8.dic ${MYDIR}

# russian gzip file is corrupted
#	tar -xzf ${DISTDIR}/zero_ru_cont_8k_v3.tar.gz -C ${PDIR}
}