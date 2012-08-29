# == Define: php::discover
#
# This resource type can be used to discover PEAR channels.
#
# === Parameters
#
# [*channel*]
#   The name of the channel you wish to discover.
#
# === Examples
#
#   php::discover { 'pear.phpunit.de': }
#
define php::pear::discover($channel = $title) {
  exec { "php-pear-discover-${channel}":
    command => "pear channel-discover ${channel}",
    unless  => "pear list-channels | grep -q ${channel}",
    require => Package['php-pear'],
  }
}