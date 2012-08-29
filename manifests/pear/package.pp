# == Define: php::pear::package
#
# This resource type makes it possible to install PEAR packages.
#
# === Parameters
#
# [*repository*]
#   The name of the repository containing the package.
#   Defaults to 'pear.php.net'.
#
# [*version*]
#   The version of the package to install. Can either be a specific version
#   number or 'latest'. Defaults to 'latest'.
#
# === Examples
#
#   class { 'php::pear':
#     version => 1.38,
#   }
#
define php::pear::package(
  $package    = $title,
  $repository = 'pear.php.net',
  $version    = 'latest'
) {
  include php::pear

  if $version != 'latest' {
    $pear_source = "${repository}/${package}-${version}"
  } else {
    $pear_source = "${repository}/${package}"
  }

  package { "pear-${repository}-${package}":
    ensure   => $version,
    name     => $package,
    provider => 'pear',
    source   => $pear_source,
    require  => Package['php-pear'],
  }
}