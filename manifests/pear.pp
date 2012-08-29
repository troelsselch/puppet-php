# == Class: php::pear
#
# This class installs the php-pear package management tool.
#
# === Parameters
#
# [*version*]
#   The version of the package to install. Takes the same arguments as the
#   'ensure' parameter. Defaults to 'present'.
#
# === Examples
#
#   class { 'php::pear':
#     version => latest,
#   }
#
class php::pear($version = present) {
  package { 'php-pear':
    ensure => $version,
  }
}