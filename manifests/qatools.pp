# == Class: php::qatools
#
# This class installs a selection of PHP quality assurance tools.
#
# See http://phpqatools.org for more information on the PHP quality assurance
# toolchain.
#
# === Examples
#
#   class { 'php::qatools': }
#
class php::qatools {
  include php::qatools::discover

  $imagemagick = $operatingsystem ? {
    ubuntu => 'imagemagick',
    centos => 'ImageMagick' # centos is case sensitive
  }

  package { $imagemagick:
    ensure => present,
  }

  php::pear::package { 'phing':
    repository => 'pear.phing.info',
  }

  php::pear::package { 'phpunit':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'phploc':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'phpdcd':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'PHP_PMD':
    repository => 'pear.phpmd.org',
  }

  php::pear::package { 'eZComponents':
    repository => 'components.ez.no', # TODO: use -a
  }

  php::pear::package { 'Finder':
    repository => 'pear.symfony.com',
    version => '2.1.8',
  }

  php::pear::package { 'fDOMDocument':
    repository => 'pear.netpirates.net',
  }

  # TODO:
  # pear channel-discover pear.phpmd.org
  # pear channel-discover pear.pdepend.org
  # pear install --alldeps phpmd/PHP_PMD

}

class php::qatools::discover {
  php::pear::discover { 'pear.phing.info': }
  php::pear::discover { 'pear.phpunit.de': }
  php::pear::discover { 'pear.netpirates.net': }
  php::pear::discover { 'pear.symfony.com': }
  php::pear::discover { 'pear.phpmd.org': }
  php::pear::discover { 'pear.pdepend.org': }
  php::pear::discover { 'components.ez.no': }
}
