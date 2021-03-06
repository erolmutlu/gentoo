# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python2_7 python3_{3,4,5} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="A pyunit extension for dependency injection"
HOMEPAGE="https://launchpad.net/testscenarios"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ppc ppc64 ~s390 ~sh sparc x86 ~amd64-linux ~x86-linux"

RDEPEND="dev-python/testtools[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}
	dev-python/setuptools[${PYTHON_USEDEP}]
	>=dev-python/pbr-0.11[${PYTHON_USEDEP}]"

python_prepare_all() {
	# Remove a faulty file from tests, missing a required attribute
	rm ${PN}/tests/test_testcase.py || die
	distutils-r1_python_prepare_all
}

python_test() {
	"${PYTHON}" -m unittest discover
}
