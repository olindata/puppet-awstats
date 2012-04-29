puppet-awstats
==============

Description
-----------
This project implements rudimentary support for an awstats module for puppet. It includes a class and a define. The class is to be included once per server, the define can be called multiple times for each domain you wish to host.

Usage
-----

`# This will install and configure awstats package
include awstats`

`# This will configure an awstats file for a specific vhost
awstats::awstats_vhost{ 'example.com':
  ensure    => present,
  docroot   => '/var/www/example.com',
  outputdir => '/var/www/example.com/awstats",
  user      => 'www-data',
  group     => 'www-data',
  domain    => 'example.com',
  aliases   => '*.example.com',
}`