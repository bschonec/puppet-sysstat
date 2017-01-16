# == Class: sysstat::params
#
# This class should be considered private.
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class sysstat::params {

  $interval    = "1"
  $count       = "1"
  $minute      = "*/10"
  $hour        = "*"
  $day         = "*"
  $month       = "*"
  $day_of_week = "*"

  case $::osfamily {
    'debian', 'redhat': {
      $sysstat_package = 'sysstat'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}
