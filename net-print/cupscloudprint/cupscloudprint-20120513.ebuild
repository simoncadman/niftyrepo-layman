# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git-2 eutils

DESCRIPTION="Google Cloud Print "
HOMEPAGE="https://ccp.niftiestsoftware.com"
EGIT_REPO_URI="git://github.com/simoncadman/CUPS-Cloud-Print.git"
EGIT_COMMIT="d07ae6081afcc2c73361c5e9e9d96b6a40cc7b1b"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"
IUSE=""
RDEPEND="!net-print/cups-cloudprint
>=dev-lang/python-2.6
net-print/cups
app-text/ghostscript-gpl
dev-python/pycups"
S=${WORKDIR}/${P}

src_install() {
	einstall DESTDIR="${D}" install
}

pkg_postinst() {
	elog Run: /usr/lib/cloudprint-cups/setupcloudprint.py to setup your Google Credentials and add your printers to CUPS
}
