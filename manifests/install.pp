# == Class: autofs::install
#
# Installs the autofs package
class autofs::install {
  package { 'autofs':
    ensure => $autofs::version,
  }
}
