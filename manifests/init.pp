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
  $threads                        = '5',
  $max_threads                    = '32',
  $server_user                    = 'USE_DEFAULTS',
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
  $group_positive_time_to_live    = '3600',
  $group_negative_time_to_live    = '60',
  $group_suggested_size           = '211',
  $group_check_files              = 'yes',
  $group_persistent               = 'yes',
  $group_shared                   = 'yes',
  $group_max_db_size              = '33554432',
  $group_auto_propagate           = 'yes',
  $hosts_enable_cache             = 'yes',
  $hosts_positive_time_to_live    = '3600',
  $hosts_negative_time_to_live    = '20',
  $hosts_suggested_size           = '211',
  $hosts_check_files              = 'yes',
  $hosts_persistent               = 'yes',
  $hosts_shared                   = 'yes',
  $hosts_max_db_size              = '33554432',
  $services_enable_cache          = 'yes',
  $services_positive_time_to_live = '28800',
  $services_negative_time_to_live = '20',
  $services_suggested_size        = '211',
  $services_check_files           = 'yes',
  $services_persistent            = 'yes',
  $services_shared                = 'yes',
  $services_max_db_size           = '33554432',
) {

  $package_name_type = type($package_name)
  if $package_name_type != 'string' and $package_name_type != 'array' {
    fail("nscd::package_name must be a string or an array. Detected type is <${package_name_type}>.")
  }

  validate_re($package_ensure, '^(present)|(installed)|(absent)$',
    'nscd::package_ensure is invalid and does not match the regex.')
  validate_absolute_path($config_path)
  validate_string($config_owner)
  validate_string($config_group)
  validate_re($config_mode, '^(\d){4}$',
    "nscd::config_mode is <${config_mode}>. Must be in four digit octal notation.")
  validate_string($service_name)
  validate_re($service_ensure, '^(present)|(running)|(absent)|(stopped)$',
    'nscd::service_ensure is invalid and does not match the regex.')

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

  case $::osfamily {
    'RedHat': {
      $default_server_user = 'nscd'
    }
    default: {
      $default_server_user = undef
    }
  }

  if $server_user == 'USE_DEFAULTS' {
    $server_user_real = $default_server_user
  } else {
    $server_user_real = $server_user
  }

  validate_string($stat_user)
  validate_re($debug_level, '^(\d)+$',
    "nscd::debug_level is <${debug_level}>. Must be a number.")
  validate_re($reload_count, '^(\d)+|(unlimited)$',
    "nscd::reload_count is <${reload_count}>. Must be a number or 'unlimited'.")
  validate_re($paranoia, '^(yes|no)$',
    "nscd::paranoia is <${paranoia}>. Must be either 'yes' or 'no'.")
  validate_re($restart_interval, '^(\d)+$',
    "nscd::restart_interval is <${restart_interval}>. Must be a number in seconds.")

  validate_re($passwd_enable_cache, '^(yes|no)$',
    "nscd::passwd_enable_cache is <${passwd_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($passwd_positive_time_to_live, '^(\d)+$',
    "nscd::passwd_positive_time_to_live is <${passwd_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($passwd_negative_time_to_live, '^(\d)+$',
    "nscd::passwd_negative_time_to_live is <${passwd_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($passwd_suggested_size, '^(\d)+$',
    "nscd::passwd_suggested_size is <${passwd_suggested_size}>. Must be a number.")
  validate_re($passwd_check_files, '^(yes|no)$',
    "nscd::passwd_check_files is <${passwd_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($passwd_persistent, '^(yes|no)$',
    "nscd::passwd_persistent is <${passwd_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($passwd_shared, '^(yes|no)$',
    "nscd::passwd_shared is <${passwd_shared}>. Must be either 'yes' or 'no'.")
  validate_re($passwd_max_db_size, '^(\d)+$',
    "nscd::passwd_max_db_size is <${passwd_max_db_size}>. Must be a number in bytes.")
  validate_re($passwd_auto_propagate, '^(yes|no)$',
    "nscd::passwd_auto_propagate is <${passwd_auto_propagate}>. Must be either 'yes' or 'no'.")

  validate_re($group_enable_cache, '^(yes|no)$',
    "nscd::group_enable_cache is <${group_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($group_positive_time_to_live, '^(\d)+$',
    "nscd::group_positive_time_to_live is <${group_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($group_negative_time_to_live, '^(\d)+$',
    "nscd::group_negative_time_to_live is <${group_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($group_suggested_size, '^(\d)+$',
    "nscd::group_suggested_size is <${group_suggested_size}>. Must be a number.")
  validate_re($group_check_files, '^(yes|no)$',
    "nscd::group_check_files is <${group_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($group_persistent, '^(yes|no)$',
    "nscd::group_persistent is <${group_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($group_shared, '^(yes|no)$',
    "nscd::group_shared is <${group_shared}>. Must be either 'yes' or 'no'.")
  validate_re($group_max_db_size, '^(\d)+$',
    "nscd::group_max_db_size is <${group_max_db_size}>. Must be a number in bytes.")
  validate_re($group_auto_propagate, '^(yes|no)$',
    "nscd::group_auto_propagate is <${group_auto_propagate}>. Must be either 'yes' or 'no'.")

  validate_re($hosts_enable_cache, '^(yes|no)$',
    "nscd::hosts_enable_cache is <${hosts_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($hosts_positive_time_to_live, '^(\d)+$',
    "nscd::hosts_positive_time_to_live is <${hosts_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($hosts_negative_time_to_live, '^(\d)+$',
    "nscd::hosts_negative_time_to_live is <${hosts_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($hosts_suggested_size, '^(\d)+$',
    "nscd::hosts_suggested_size is <${hosts_suggested_size}>. Must be a number.")
  validate_re($hosts_check_files, '^(yes|no)$',
    "nscd::hosts_check_files is <${hosts_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($hosts_persistent, '^(yes|no)$',
    "nscd::hosts_persistent is <${hosts_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($hosts_shared, '^(yes|no)$',
    "nscd::hosts_shared is <${hosts_shared}>. Must be either 'yes' or 'no'.")
  validate_re($hosts_max_db_size, '^(\d)+$',
    "nscd::hosts_max_db_size is <${hosts_max_db_size}>. Must be a number in bytes.")

  validate_re($services_enable_cache, '^(yes|no)$',
    "nscd::services_enable_cache is <${services_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($services_positive_time_to_live, '^(\d)+$',
    "nscd::services_positive_time_to_live is <${services_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($services_negative_time_to_live, '^(\d)+$',
    "nscd::services_negative_time_to_live is <${services_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($services_suggested_size, '^(\d)+$',
    "nscd::services_suggested_size is <${services_suggested_size}>. Must be a number.")
  validate_re($services_check_files, '^(yes|no)$',
    "nscd::services_check_files is <${services_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($services_persistent, '^(yes|no)$',
    "nscd::services_persistent is <${services_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($services_shared, '^(yes|no)$',
    "nscd::services_shared is <${services_shared}>. Must be either 'yes' or 'no'.")
  validate_re($services_max_db_size, '^(\d)+$',
    "nscd::services_max_db_size is <${services_max_db_size}>. Must be a number in bytes.")

  package { $package_name:
    ensure => $package_ensure,
  }

  file { 'nscd_config':
    ensure  => file,
    path    => $config_path,
    content => template('nscd/nscd.conf.erb'),
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    require => Package[$package_name],
  }

  service { 'nscd_service':
    ensure    => $service_ensure,
    name      => $service_name,
    enable    => $service_enable_real,
    subscribe => File['nscd_config'],
  }
}
