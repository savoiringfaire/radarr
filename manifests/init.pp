# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include radarr
class radarr {
  apt::ppa { 'ppa:marcushann/radarr': }
  -> package { 'radarr': }

  user { 'radarr':
    ensure => present
  }

  file { '/home/radarr':
    ensure => directory,
    owner => 'radarr',
    group => 'radarr'
  }

  file { '/lib/systemd/system/radarr.service':
    ensure => file,
    content => template('radarr/radarr.service.erb')
  }

  service { 'radarr':
    ensure => running,
    enable => true,
  }
}
