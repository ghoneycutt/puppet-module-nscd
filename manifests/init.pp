# == Class: nscd
#
# Module to manage nscd
#
class nscd (
  $package_name                   = 'nscd',
  $package_ensure                 = 'present',
  $config_path                    = '/etc/nscd.conf',
  $config_owner                   = 'root',
  $config_group                   = 'root',
  $config_mode                    = '0644',
  $service_name                   = 'nscd',
  $service_ensure                 = 'running',
  $service_enable                 = true,
  $logfile                        = '/var/log/nscd.log',
  $threads                        = 4,
  $max_threads                    = 32,
  $server_user                    = 'nscd',
  $stat_user                      = 'root',
  $debug_level                    = '0',
  $reload_count                   = '5',
  $paranoia                       = 'no',
  $restart_interval               = '3600',
  $passwd_enable_cache            = 'yes',
  $passwd_positive_time_to_live   = '600',
  $passwd_negative_time_to_live   = '20',
  $passwd_suggested_size          = '211',
  $passwd_check_files             = 'yes',
  $passwd_persistent              = 'yes',
  $passwd_shared                  = 'yes',
  $passwd_max_db_size             = '33554432',
  $passwd_auto_propagate          = 'yes',
  $group_enable_cache             = 'yes',
  $group_positive_time_to_live    = '600',
  $group_negative_time_to_live    = '20',
  $group_suggested_size           = '211',
  $group_check_files              = 'yes',
  $group_persistent               = 'yes',
  $group_shared                   = 'yes',
  $group_max_db_size              = '33554432',
  $group_auto_propagate           = 'yes',
  $hosts_enable_cache             = 'yes',
  $hosts_positive_time_to_live    = '600',
  $hosts_negative_time_to_live    = '20',
  $hosts_suggested_size           = '211',
  $hosts_check_files              = 'yes',
  $hosts_persistent               = 'yes',
  $hosts_shared                   = 'yes',
  $hosts_max_db_size              = '33554432',
  $services_enable_cache          = 'yes',
  $services_positive_time_to_live = '600',
  $services_negative_time_to_live = '20',
  $services_suggested_size        = '211',
  $services_check_files           = 'yes',
  $services_persistent            = 'yes',
  $services_shared                = 'yes',
  $services_max_db_size           = '33554432',
) {

  # validate parameters
  validate_re($package_ensure, '^(present)|(installed)|(absent)$',
    "nscd::package_ensure is invalid and does not match the regex.")

  validate_absolute_path($config_path)

  validate_re($config_mode, '^(\d){4}$',
    "nscd::config_mode is <${config_mode}>. Must be in four digit octal notation.")

  validate_re($service_ensure, '^(present)|(running)|(absent)|(stopped)$',
    "nscd::service_ensure is invalid and does not match the regex.")

  if type($service_enable) == 'String' {
    $service_enable_real = str2bool($service_enable)
  } else {
    $service_enable_real = $service_enable
  }
  validate_bool($service_enable_real)

  validate_absolute_path($logfile)

  validate_re($threads, '^(\d)+$',
    "nscd::threads is <${threads}>. Must be a number.")

  validate_re($max_threads, '^(\d)+$',
    "nscd::max_threads is <${max_threads}>. Must be a number.")

  # define resources
  package { 'nscd_package':
    ensure => $package_ensure,
    name   => $package_name,
  }

  file { 'nscd_config':
    ensure  => file,
    path    => $config_path,
    content => template('nscd/nscd.conf.erb'),
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    require => Package['nscd_package'],
  }

  service { 'nscd_service':
    ensure    => $service_ensure,
    name      => $service_name,
    enable    => $service_enable_real,
    subscribe => File['nscd_config'],
  }
}
