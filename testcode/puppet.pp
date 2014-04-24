# puppet.pp - 2014-04-24 05:37
#
# Copyright (c) 2014 Paul Houghton <paul4hough@gmail.com>
#
class master::php::composer {

  exec { 'curl -sS https://getcomposer.org/installer | php' :
    cwd     => $::root_home,
    creates => "${::root_home}/composer.phar",
  }
  ->
  file { '/usr/local/bin/composer' :
    ensure   => 'file',
    mode     => '0755',
    source   => "${::root_home}/composer.phar",
  }
}
