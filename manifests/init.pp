class awstats {

  package { 'awstats':
    ensure => present
  }

  file { '/etc/awstats':
    ensure => directory,
    mode   => 0755,
    owner  => root,
    group  => root,
  }

  file { '/var/lib/awstats':
    ensure => directory,
    mode   => 0777,
    owner  => www-data,
    group  => www-data,
  }

}
