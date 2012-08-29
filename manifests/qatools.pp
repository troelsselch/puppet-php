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

  php::pear::package { 'phing':
    repository => 'pear.phing.info',
  }

  php::pear::package { 'PHP_PMD':
    repository => 'pear.phpmd.org',
  }

  php::pear::package { 'phpcpd':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'phploc':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'phpdcd':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'bytekit':
    repository => 'pear.phpunit.de',
  }

  php::pear::package { 'PHPDocumentor': 
    repository => 'pear.phpdoc.org',
  }

  php::pear::package { 'PHP_CodeSniffer': }

  php::pear::package { 'HTTP_Request2': }

  php::pear::package { 'PHP_CodeBrowser':
    repository => 'pear.phpunit.de',
  }
}

class php::qatools::discover {
  php::pear::discover { 'pear.phing.info': }
  php::pear::discover { 'pear.pdepend.org': }
  php::pear::discover { 'pear.phpdoc.org': }
  php::pear::discover { 'pear.phpmd.org': }
  php::pear::discover { 'pear.phpunit.de': }
  php::pear::discover { 'components.ez.no': }
  php::pear::discover { 'pear.symfony-project.com': }
}