# == Class: sysstat
#
# Parameters
# ----------
#
# * `interval`
# The interval in seconds between runs of 'sa1'.  This should probably be set
# to '1' and never anything else.  See: 'man sa1'
# Default: 1
#
# * `count`
# The number of times to run 'sa1'.  See: 'man sa1'
# Default: 1
#
# * `minute`
# The minute parameter of /etc/cron.d/sysstat.
# Default:  "*/10"
#
# * `hour`
# The hour parameter of /etc/cron.d/sysstat.
# Default:  "*"
#
# * `day`
# The day parameter of /etc/cron.d/sysstat.
# Default:  "*"
#
# * `month`
# The month parameter of /etc/cron.d/sysstat.
# Default:  "*"
#
# * `day_of_week`
# The day of the week parameter of /etc/cron.d/sysstat.
# Default:  "*"
#
#
# Examples
# --------
#
# Run sar1 every minute:
#
# @example
#    class { 'sysstat':
#      minute => "*/1",
#    }
#
#
# === Authors
#
# Joshua Hoblitt <jhoblitt@cpan.org>
#
# === Copyright
#
# Copyright (C) 2013 Joshua Hoblitt
#
class sysstat (
  $interval    = $::sysstat::params::interval,
  $count       = $::sysstat::params::count, 
  $minute      = $::sysstat::params::minute,
  $hour        = $::sysstat::params::hour, 
  $day         = $::sysstat::params::day, 
  $month       = $::sysstat::params::month, 
  $day_of_week = $::sysstat::params::day_of_week,
) inherits sysstat::params {

  file {'/etc/cron.d/sysstat':
    owner => 'root',
    group => 'root',
    mode  => '0600',
    content => template('sysstat/sysstat.erb'),
  }

  class { 'sysstat::install': } ->
  class { 'sysstat::service': } ->
  Class['Sysstat']
}
