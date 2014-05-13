# == Class: autofs::configure
#
# Configures the autofs master file
class autofs::configure {
  file { '/etc/auto.master':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/autofs/auto.master',
  }

  file { '/etc/auto.master.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
  }
}
