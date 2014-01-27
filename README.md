Puppet module for PHP
=====================

This module allows you to install the basic PHP package and various pre-
packaged modules, as well as extensions from the PHP Extension and Application
Repository (PEAR). Also, it contains a class which can be used to install a
wide selection of PHP quality assurance tools.

This project was forked from https://github.com/wulff/puppet-php and has been updated to support CentOS.

Support
-------

It has been tested on CentOS 6.4 from http://puppet-vagrant-boxes.puppetlabs.com/centos-64-x64-vbox4210.box.



Basic usage
-----------

Install PHP:

    class { 'php':
      version => latest,
    }

Install the MySQL module:

    php::module { 'mysqlnd':
      restart => Service['apache2'],
    }

Install PEAR package:

    php::pear::package { 'phploc':
      repository => 'pear.phpunit.de',
    }

Discover PEAR channel:

    php::pear::discover {
      'pear.phpunit.de':
    }

Notes
-----

 * PEAR support based on https://github.com/treehouseagency/puppet-pear
 * PHP QA support based on https://github.com/rafaelfelix/puppet-phpqatools

Authors
-------

Morten Wulff <wulff@ratatosk.net>
Troels Selch <troels@golthak.dk>
