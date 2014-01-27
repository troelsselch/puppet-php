# == Class: php
#
# This class installs the command line PHP package.
#
# === Parameters:
#
# [*version*]
#   The version of the package to install. Takes the same arguments as the
#   'ensure' parameter. Defaults to 'present'.
#
# === Examples
#
#   class { 'php':
#     version => latest,
#   }
#
class php($version = present) {
  $phpcli = $operatingsystem ? {
    centos  => 'php-cli',
    ubuntu  => 'php5-cli',
  }

  package { $phpcli:
    ensure => $version,
  }
}
