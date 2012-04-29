define awstats::awstats_vhost($ensure = present, $docroot, $outputdir, $user,
  $group, $domain, $aliases) {
  file { "/etc/awstats/awstats.$name.conf":
    ensure  => "$ensure",
    require => [
      Package[apache],
      File[$docroot],
      User[$name]
    ],
    mode    => "644",
    owner   => $user,
    group   => $group,
    content => template("apache2/awstats.conf.erb"),
  }



  cron { "awstats-update-run-$name":
    ensure  => $ensure,
    command => "/usr/bin/perl /usr/share/doc/awstats/examples/awstats_buildstaticpages.pl -config=$name -update -awstatsprog=/usr/lib/cgi-bin/awstats.pl -dir=${outputdir} -diricons=/awstats/awstats-icon/",
    user    => $user,
    minute  => [1, 11, 21, 31, 41, 51],
    require => User[$user]
  }

}
