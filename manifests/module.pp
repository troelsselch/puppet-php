# == Define: php::module
#
# This resource type can be used to install PHP modules.
#
# === Parameters
#
# [*restart*]
#   An optional service or services to restart after the module has been
#   installed. Defaults to 'undef'.
#
# [*version*]
#   The version of the package to install. Takes the same arguments as the
#   'ensure' parameter. Defaults to 'present'.
#
# === Examples
#
#   php::module { 'mysqlnd':
#     restart => Service['apache2'],
#   }
#
define php::module(
  $module  = $title,
  $restart = undef,
  $version = present
) {
  package { "php5-${module}":
    ensure  => $version,
    require => Package['php5-cli'],
    notify  => $restart,
  }
}