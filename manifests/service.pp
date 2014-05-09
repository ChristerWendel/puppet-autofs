# == Class: autofs::service
#
# Controls the autofs service
class autofs::service {
  $ensure = $autofs::start ? {true => running, default => stopped}

  service { 'autofs':
    ensure => $ensure,
    enable => $autofs::enable,
  }
}
