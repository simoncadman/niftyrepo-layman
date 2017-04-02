# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $
EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit eutils git-2 python-single-r1
DESCRIPTION="Google Cloud Print"
HOMEPAGE="https://ccp.niftiestsoftware.com"
EGIT_REPO_URI="git://github.com/simoncadman/CUPS-Cloud-Print.git"
EGIT_COMMIT="a4eff8b63d70942e0f59ff6c382f64f2498135f9"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~x64 ~amd64-fbsd ~x86-fbsd"
RDEPEND="!net-print/cups-cloudprint
dev-lang/python:2.7
net-print/cups
app-text/ghostscript-gpl
dev-python/pycups
dev-python/httplib2
media-gfx/imagemagick[postscript,jpeg,png]
dev-python/six"
S=${WORKDIR}/${P}

src_install() {
       einstall DESTDIR="${D}" install
       cd "${D}"
       python2 -m compileall -q -f .
       
       insinto /etc/cron.daily
       newins "${S}"/cron.daily/cupscloudprint cupscloudprint
       fperms 0755 /etc/cron.daily/cupscloudprint
}

pkg_postinst() {
       /usr/share/cloudprint-cups/upgrade.py
}

pkg_prerm() {
       rm -rf /usr/share/cloudprint-cups/.cache
}
