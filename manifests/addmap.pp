# == Type: autofs::addmap
#
# Adds a map to auto.master
#
# === Parameters
# ["mountpoint"]
#   Base directory for mounts
#
# ["options"]
#   A string containing options for the map
#
# ["content"]
#   An array of lines to be writen into the map

define autofs::addmap($mountpoint, $options = '', $content = []) {
  file { "${title}.autofs":
    path    => "/etc/auto.master.d/${title}.autofs",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('autofs/addmap.erb'),
    notify  => Service['autofs'],
  }

  file { $title:
    path    => "/etc/auto.${title}",
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('autofs/writemap.erb'),
    notify  => Service['autofs'],
  }
}
