# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="RPool program user"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( rpool )
acct-user_add_deps
SLOT="0"
