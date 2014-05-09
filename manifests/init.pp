# == Class: autofs
#
# A module to handle autofs mounts
#
# === Parameters
# ["version"]
#   The package version to install
#
# ["enable"]
#   Should the service be enabled during boot time?
#
# ["start"]
#   Should the service be started by Puppet

class autofs (
  $version = 'present',
  $enable = true,
  $start = true
  )  {
    class{'autofs::install': } ->
    class{'autofs::configure': } ~>
    class{'autofs::service': } ->
    Class['autofs']
  }
