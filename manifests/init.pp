# == Class: nscd
#
# Module to manage nscd
#
class nscd (
  $package_name                     = 'USE_DEFAULTS',
  $package_ensure                   = 'present',
  $package_source                   = 'USE_DEFAULTS',
  $package_adminfile                = 'USE_DEFAULTS',
  $config_path                      = '/etc/nscd.conf',
  $config_owner                     = 'root',
  $config_group                     = 'root',
  $config_mode                      = '0644',
  $service_name                     = 'USE_DEFAULTS',
  $service_ensure                   = 'running',
  $service_enable                   = true,
  $service_provider                 = 'USE_DEFAULTS',
  $logfile                          = 'USE_DEFAULTS',
  $threads                          = '5',
  $max_threads                      = '32',
  $server_user                      = 'USE_DEFAULTS',
  $stat_user                        = 'root',
  $debug_level                      = '0',
  $reload_count                     = '5',
  $paranoia                         = 'no',
  $restart_interval                 = '3600',
  $enable_db_passwd                 = 'USE_DEFAULTS',
  $enable_db_group                  = 'USE_DEFAULTS',
  $enable_db_hosts                  = 'USE_DEFAULTS',
  $enable_db_services               = 'USE_DEFAULTS',
  $enable_db_netgroup               = 'USE_DEFAULTS',
  $enable_db_audit_user             = 'USE_DEFAULTS',
  $enable_db_auth_attr              = 'USE_DEFAULTS',
  $enable_db_bootparams             = 'USE_DEFAULTS',
  $enable_db_ethers                 = 'USE_DEFAULTS',
  $enable_db_exec_attr              = 'USE_DEFAULTS',
  $enable_db_ipnodes                = 'USE_DEFAULTS',
  $enable_db_netmasks               = 'USE_DEFAULTS',
  $enable_db_networks               = 'USE_DEFAULTS',
  $enable_db_printers               = 'USE_DEFAULTS',
  $enable_db_prof_attr              = 'USE_DEFAULTS',
  $enable_db_project                = 'USE_DEFAULTS',
  $enable_db_protocols              = 'USE_DEFAULTS',
  $enable_db_rpc                    = 'USE_DEFAULTS',
  $enable_db_tnrhdb                 = 'USE_DEFAULTS',
  $enable_db_tnrhtp                 = 'USE_DEFAULTS',
  $enable_db_user_attr              = 'USE_DEFAULTS',
  $enable_opt_auto_propagate        = 'USE_DEFAULTS',
  $passwd_enable_cache              = 'yes',
  $passwd_positive_time_to_live     = '600',
  $passwd_negative_time_to_live     = '20',
  $passwd_keep_hot_count            = '2048',
  $passwd_suggested_size            = '211',
  $passwd_check_files               = 'yes',
  $passwd_persistent                = 'yes',
  $passwd_shared                    = 'yes',
  $passwd_max_db_size               = '33554432',
  $passwd_auto_propagate            = 'yes',
  $group_enable_cache               = 'yes',
  $group_positive_time_to_live      = '3600',
  $group_negative_time_to_live      = '60',
  $group_keep_hot_count             = '2048',
  $group_suggested_size             = '211',
  $group_check_files                = 'yes',
  $group_persistent                 = 'yes',
  $group_shared                     = 'yes',
  $group_max_db_size                = '33554432',
  $group_auto_propagate             = 'yes',
  $hosts_enable_cache               = 'yes',
  $hosts_positive_time_to_live      = '3600',
  $hosts_negative_time_to_live      = '20',
  $hosts_keep_hot_count             = '2048',
  $hosts_suggested_size             = '211',
  $hosts_check_files                = 'yes',
  $hosts_persistent                 = 'yes',
  $hosts_shared                     = 'yes',
  $hosts_max_db_size                = '33554432',
  $services_enable_cache            = 'yes',
  $services_positive_time_to_live   = '28800',
  $services_negative_time_to_live   = '20',
  $services_keep_hot_count          = '2048',
  $services_suggested_size          = '211',
  $services_check_files             = 'yes',
  $services_persistent              = 'yes',
  $services_shared                  = 'yes',
  $services_max_db_size             = '33554432',
  $netgroup_enable_cache            = 'yes',
  $netgroup_positive_time_to_live   = '28800',
  $netgroup_negative_time_to_live   = '20',
  $netgroup_suggested_size          = '211',
  $netgroup_check_files             = 'yes',
  $netgroup_persistent              = 'yes',
  $netgroup_shared                  = 'yes',
  $netgroup_max_db_size             = '33554432',
  $audit_user_enable_cache          = 'yes',
  $audit_user_positive_time_to_live = '3600',
  $audit_user_negative_time_to_live = '20',
  $audit_user_keep_hot_count        = '2048',
  $audit_user_suggested_size        = '211',
  $audit_user_check_files           = 'yes',
  $audit_user_persistent            = 'yes',
  $audit_user_shared                = 'yes',
  $audit_user_max_db_size           = '33554432',
  $audit_user_auto_propagate        = 'yes',
  $auth_attr_enable_cache           = 'yes',
  $auth_attr_positive_time_to_live  = '3600',
  $auth_attr_negative_time_to_live  = '20',
  $auth_attr_keep_hot_count         = '2048',
  $auth_attr_suggested_size         = '211',
  $auth_attr_check_files            = 'yes',
  $auth_attr_persistent             = 'yes',
  $auth_attr_shared                 = 'yes',
  $auth_attr_max_db_size            = '33554432',
  $auth_attr_auto_propagate         = 'yes',
  $bootparams_enable_cache          = 'yes',
  $bootparams_positive_time_to_live = '3600',
  $bootparams_negative_time_to_live = '20',
  $bootparams_keep_hot_count        = '2048',
  $bootparams_suggested_size        = '211',
  $bootparams_check_files           = 'yes',
  $bootparams_persistent            = 'yes',
  $bootparams_shared                = 'yes',
  $bootparams_max_db_size           = '33554432',
  $bootparams_auto_propagate        = 'yes',
  $ethers_enable_cache              = 'yes',
  $ethers_positive_time_to_live     = '3600',
  $ethers_negative_time_to_live     = '20',
  $ethers_keep_hot_count            = '2048',
  $ethers_suggested_size            = '211',
  $ethers_check_files               = 'yes',
  $ethers_persistent                = 'yes',
  $ethers_shared                    = 'yes',
  $ethers_max_db_size               = '33554432',
  $ethers_auto_propagate            = 'yes',
  $exec_attr_enable_cache           = 'yes',
  $exec_attr_positive_time_to_live  = '3600',
  $exec_attr_negative_time_to_live  = '20',
  $exec_attr_keep_hot_count         = '2048',
  $exec_attr_suggested_size         = '211',
  $exec_attr_check_files            = 'yes',
  $exec_attr_persistent             = 'yes',
  $exec_attr_shared                 = 'yes',
  $exec_attr_max_db_size            = '33554432',
  $exec_attr_auto_propagate         = 'yes',
  $ipnodes_enable_cache             = 'yes',
  $ipnodes_positive_time_to_live    = '3600',
  $ipnodes_negative_time_to_live    = '20',
  $ipnodes_keep_hot_count           = '2048',
  $ipnodes_suggested_size           = '211',
  $ipnodes_check_files              = 'yes',
  $ipnodes_persistent               = 'yes',
  $ipnodes_shared                   = 'yes',
  $ipnodes_max_db_size              = '33554432',
  $ipnodes_auto_propagate           = 'yes',
  $netmasks_enable_cache            = 'yes',
  $netmasks_positive_time_to_live   = '3600',
  $netmasks_negative_time_to_live   = '20',
  $netmasks_keep_hot_count          = '2048',
  $netmasks_suggested_size          = '211',
  $netmasks_check_files             = 'yes',
  $netmasks_persistent              = 'yes',
  $netmasks_shared                  = 'yes',
  $netmasks_max_db_size             = '33554432',
  $netmasks_auto_propagate          = 'yes',
  $networks_enable_cache            = 'yes',
  $networks_positive_time_to_live   = '3600',
  $networks_negative_time_to_live   = '20',
  $networks_keep_hot_count          = '2048',
  $networks_suggested_size          = '211',
  $networks_check_files             = 'yes',
  $networks_persistent              = 'yes',
  $networks_shared                  = 'yes',
  $networks_max_db_size             = '33554432',
  $networks_auto_propagate          = 'yes',
  $printers_enable_cache            = 'yes',
  $printers_positive_time_to_live   = '3600',
  $printers_negative_time_to_live   = '20',
  $printers_keep_hot_count          = '2048',
  $printers_suggested_size          = '211',
  $printers_check_files             = 'yes',
  $printers_persistent              = 'yes',
  $printers_shared                  = 'yes',
  $printers_max_db_size             = '33554432',
  $printers_auto_propagate          = 'yes',
  $prof_attr_enable_cache           = 'yes',
  $prof_attr_positive_time_to_live  = '3600',
  $prof_attr_negative_time_to_live  = '20',
  $prof_attr_keep_hot_count         = '2048',
  $prof_attr_suggested_size         = '211',
  $prof_attr_check_files            = 'yes',
  $prof_attr_persistent             = 'yes',
  $prof_attr_shared                 = 'yes',
  $prof_attr_max_db_size            = '33554432',
  $prof_attr_auto_propagate         = 'yes',
  $project_enable_cache             = 'yes',
  $project_positive_time_to_live    = '3600',
  $project_negative_time_to_live    = '20',
  $project_keep_hot_count           = '2048',
  $project_suggested_size           = '211',
  $project_check_files              = 'yes',
  $project_persistent               = 'yes',
  $project_shared                   = 'yes',
  $project_max_db_size              = '33554432',
  $project_auto_propagate           = 'yes',
  $protocols_enable_cache           = 'yes',
  $protocols_positive_time_to_live  = '3600',
  $protocols_negative_time_to_live  = '20',
  $protocols_keep_hot_count         = '2048',
  $protocols_suggested_size         = '211',
  $protocols_check_files            = 'yes',
  $protocols_persistent             = 'yes',
  $protocols_shared                 = 'yes',
  $protocols_max_db_size            = '33554432',
  $protocols_auto_propagate         = 'yes',
  $rpc_enable_cache                 = 'yes',
  $rpc_positive_time_to_live        = '3600',
  $rpc_negative_time_to_live        = '20',
  $rpc_keep_hot_count               = '2048',
  $rpc_suggested_size               = '211',
  $rpc_check_files                  = 'yes',
  $rpc_persistent                   = 'yes',
  $rpc_shared                       = 'yes',
  $rpc_max_db_size                  = '33554432',
  $rpc_auto_propagate               = 'yes',
  $tnrhdb_enable_cache              = 'yes',
  $tnrhdb_positive_time_to_live     = '3600',
  $tnrhdb_negative_time_to_live     = '20',
  $tnrhdb_keep_hot_count            = '2048',
  $tnrhdb_suggested_size            = '211',
  $tnrhdb_check_files               = 'yes',
  $tnrhdb_persistent                = 'yes',
  $tnrhdb_shared                    = 'yes',
  $tnrhdb_max_db_size               = '33554432',
  $tnrhdb_auto_propagate            = 'yes',
  $tnrhtp_enable_cache              = 'yes',
  $tnrhtp_positive_time_to_live     = '3600',
  $tnrhtp_negative_time_to_live     = '20',
  $tnrhtp_keep_hot_count            = '2048',
  $tnrhtp_suggested_size            = '211',
  $tnrhtp_check_files               = 'yes',
  $tnrhtp_persistent                = 'yes',
  $tnrhtp_shared                    = 'yes',
  $tnrhtp_max_db_size               = '33554432',
  $tnrhtp_auto_propagate            = 'yes',
  $user_attr_enable_cache           = 'yes',
  $user_attr_positive_time_to_live  = '3600',
  $user_attr_negative_time_to_live  = '20',
  $user_attr_keep_hot_count         = '2048',
  $user_attr_suggested_size         = '211',
  $user_attr_check_files            = 'yes',
  $user_attr_persistent             = 'yes',
  $user_attr_shared                 = 'yes',
  $user_attr_max_db_size            = '33554432',
  $user_attr_auto_propagate         = 'yes',
) {

  validate_re($package_ensure, '^(present)|(installed)|(absent)$',
    'nscd::package_ensure is invalid and does not match the regex.')
  validate_absolute_path($config_path)
  validate_string($config_owner)
  validate_string($config_group)
  validate_re($config_mode, '^(\d){4}$',
    "nscd::config_mode is <${config_mode}>. Must be in four digit octal notation.")
  validate_re($service_ensure, '^(present)|(running)|(absent)|(stopped)$',
    'nscd::service_ensure is invalid and does not match the regex.')

  if is_string($service_enable) {
    $service_enable_real = str2bool($service_enable)
  } else {
    $service_enable_real = $service_enable
  }
  validate_bool($service_enable_real)

  validate_re($threads, '^(\d)+$',
    "nscd::threads is <${threads}>. Must be a number.")
  validate_re($max_threads, '^(\d)+$',
    "nscd::max_threads is <${max_threads}>. Must be a number.")

  case $::osfamily {
    'RedHat': {
      $default_logfile           = '/var/log/nscd.log'
      $default_server_user       = 'nscd'
      $package_adminfile_default = undef
      $package_name_default      = 'nscd'
      $package_source_default    = undef
      $service_name_default      = 'nscd'
      case $::operatingsystemmajrelease {
        '5': {
          $service_provider_default          = undef
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = false
          $enable_db_netgroup_default        = false
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        '6': {
          $service_provider_default          = undef
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = true
          $enable_db_netgroup_default        = false
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        '7': {
          $service_provider_default          = undef
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = true
          $enable_db_netgroup_default        = true
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        '8': {
          $service_provider_default          = undef
          $enable_db_passwd_default          = false
          $enable_db_group_default           = false
          $enable_db_hosts_default           = true
          $enable_db_services_default        = false
          $enable_db_netgroup_default        = false
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        # Added for Amazon Linux support
        # Amazon Linux has 'YYYY-MM' version format
        # https://github.com/ghoneycutt/puppet-module-nscd/issues/41
        /^201[5-7]+$/: {
          $service_provider_default          = undef
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = true
          $enable_db_netgroup_default        = true
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        default: {
          fail("Nscd is only supported on EL 5, 6, 7, 8 and Amazon linux 2015-2017. Your operatingsystemmajrelease is identified as <${::operatingsystemmajrelease}>.")
        }
      }
    }
    'Suse': {
      $default_logfile           = '/var/log/nscd.log'
      $package_adminfile_default = undef
      $package_name_default      = 'nscd'
      $package_source_default    = undef
      $service_name_default      = 'nscd'
      # Suse sadly do not support $::operatingsystemmajrelease.
      # Alternative approach is to use $::operatingsystemrelease and use regex to ignore the minor number
      case $::operatingsystemrelease {
        /^10\./: {
          $default_server_user               = undef
          $service_provider_default          = undef
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = false
          $enable_db_netgroup_default        = false
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = false
        }
        /^11\./: {
          $default_server_user               = undef
          $service_provider_default          = undef
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = true
          $enable_db_netgroup_default        = false
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        /^12\./, /^13\./, /^15\./: {
          $default_server_user               = 'nscd'
          $service_provider_default          = 'systemd'
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = true
          $enable_db_netgroup_default        = true
          $enable_db_audit_user_default      = false
          $enable_db_auth_attr_default       = false
          $enable_db_bootparams_default      = false
          $enable_db_ethers_default          = false
          $enable_db_exec_attr_default       = false
          $enable_db_ipnodes_default         = false
          $enable_db_netmasks_default        = false
          $enable_db_networks_default        = false
          $enable_db_printers_default        = false
          $enable_db_prof_attr_default       = false
          $enable_db_project_default         = false
          $enable_db_protocols_default       = false
          $enable_db_rpc_default             = false
          $enable_db_tnrhdb_default          = false
          $enable_db_tnrhtp_default          = false
          $enable_db_user_attr_default       = false
          $enable_opt_auto_propagate_default = true
        }
        default: {
          fail("Nscd is only supported on Suse 10, 11, 12, 13 and 15. Your operatingsystemrelease is identified as <${::operatingsystemrelease}>.")
        }
      }
    }
    'Debian': {
      $default_logfile                   = '/var/log/nscd.log'
      $default_server_user               = undef
      $service_provider_default          = undef
      $enable_db_passwd_default          = true
      $enable_db_group_default           = true
      $enable_db_hosts_default           = true
      $enable_db_services_default        = true
      $enable_db_netgroup_default        = false
      $enable_db_audit_user_default      = false
      $enable_db_auth_attr_default       = false
      $enable_db_bootparams_default      = false
      $enable_db_ethers_default          = false
      $enable_db_exec_attr_default       = false
      $enable_db_ipnodes_default         = false
      $enable_db_netmasks_default        = false
      $enable_db_networks_default        = false
      $enable_db_printers_default        = false
      $enable_db_prof_attr_default       = false
      $enable_db_project_default         = false
      $enable_db_protocols_default       = false
      $enable_db_rpc_default             = false
      $enable_db_tnrhdb_default          = false
      $enable_db_tnrhtp_default          = false
      $enable_db_user_attr_default       = false
      $enable_opt_auto_propagate_default = true
      $package_adminfile_default         = undef
      $package_name_default              = 'nscd'
      $package_source_default            = undef
      $service_name_default              = 'nscd'
    }
    'Solaris': {
      $default_logfile           = '/var/adm/nscd.log'
      $default_server_user       = undef
      $package_adminfile_default = undef
      $package_name_default      = 'SUNWcsu'
      $package_source_default    = '/var/spool/pkg'
      $service_provider_default  = undef
      $service_name_default      = 'name-service-cache'
      case $::kernelrelease {
        '5.10': {
          $enable_db_passwd_default          = true
          $enable_db_group_default           = true
          $enable_db_hosts_default           = true
          $enable_db_services_default        = true
          $enable_db_netgroup_default        = false
          $enable_db_audit_user_default      = true
          $enable_db_auth_attr_default       = true
          $enable_db_bootparams_default      = true
          $enable_db_ethers_default          = true
          $enable_db_exec_attr_default       = true
          $enable_db_ipnodes_default         = true
          $enable_db_netmasks_default        = true
          $enable_db_networks_default        = true
          $enable_db_printers_default        = true
          $enable_db_prof_attr_default       = true
          $enable_db_project_default         = true
          $enable_db_protocols_default       = true
          $enable_db_rpc_default             = true
          $enable_db_tnrhdb_default          = true
          $enable_db_tnrhtp_default          = true
          $enable_db_user_attr_default       = true
          $enable_opt_auto_propagate_default = false
        }
        default: {
          fail("Nscd is only supported on Solaris 5.10. Your kernelrelease is identified as <${::kernelrelease}>.")
        }
      }
    }
    default: {
      fail("Nscd supports osfamilies Debian, RedHat, Suse and Solaris. Detected osfamily is <${::osfamily}>.")
    }
  }

  if $logfile == 'USE_DEFAULTS' {
    $logfile_real = $default_logfile
  } else {
    $logfile_real = $logfile
  }
  validate_absolute_path($logfile_real)

  if $package_adminfile == 'USE_DEFAULTS' {
    $package_adminfile_real = $package_adminfile_default
  } else {
    $package_adminfile_real = $package_adminfile
  }

  if !is_string($package_adminfile_real) {
    fail('nscd::package_adminfile must be a string.')
  }

  if $package_name == 'USE_DEFAULTS' {
    $package_name_real = $package_name_default
  } else {
    $package_name_real = $package_name
  }

  if !is_string($package_name_real) and !is_array($package_name_real) {
    fail('nscd::package_name must be a string or an array.')
  }

  if $package_source == 'USE_DEFAULTS' {
    $package_source_real = $package_source_default
  } else {
    $package_source_real = $package_source
  }

  if !is_string($package_source_real) {
    fail('nscd::package_source must be a string.')
  }

  if $server_user == 'USE_DEFAULTS' {
    $server_user_real = $default_server_user
  } else {
    $server_user_real = $server_user
  }

  if $service_name == 'USE_DEFAULTS' {
    $service_name_real = $service_name_default
  } else {
    $service_name_real = $service_name
  }

  validate_string($service_name_real)

  if $service_provider == 'USE_DEFAULTS' {
    $service_provider_real = $service_provider_default
  } else {
    if $service_provider != undef {
      validate_string($service_provider)
    }
    $service_provider_real = $service_provider
  }

  if is_bool($enable_db_passwd) {
    $enable_db_passwd_real = $enable_db_passwd
  } else {
    $enable_db_passwd_real = $enable_db_passwd ? {
      'USE_DEFAULTS' => $enable_db_passwd_default,
      default        => str2bool($enable_db_passwd)
    }
  }

  if is_bool($enable_db_group) {
    $enable_db_group_real = $enable_db_group
  } else {
    $enable_db_group_real = $enable_db_group ? {
      'USE_DEFAULTS' => $enable_db_group_default,
      default        => str2bool($enable_db_group)
    }
  }

  if is_bool($enable_db_hosts) {
    $enable_db_hosts_real = $enable_db_hosts
  } else {
    $enable_db_hosts_real = $enable_db_hosts ? {
      'USE_DEFAULTS' => $enable_db_hosts_default,
      default        => str2bool($enable_db_hosts)
    }
  }

  if is_bool($enable_db_services) {
    $enable_db_services_real = $enable_db_services
  } else {
    $enable_db_services_real = $enable_db_services ? {
      'USE_DEFAULTS' => $enable_db_services_default,
      default        => str2bool($enable_db_services)
    }
  }

  if is_bool($enable_db_netgroup) {
    $enable_db_netgroup_real = $enable_db_netgroup
  } else {
    $enable_db_netgroup_real = $enable_db_netgroup ? {
      'USE_DEFAULTS' => $enable_db_netgroup_default,
      default        => str2bool($enable_db_netgroup)
    }
  }

  if is_bool($enable_db_audit_user) {
    $enable_db_audit_user_real = $enable_db_audit_user
  } else {
    $enable_db_audit_user_real = $enable_db_audit_user ? {
      'USE_DEFAULTS' => $enable_db_audit_user_default,
      default        => str2bool($enable_db_audit_user)
    }
  }

  if is_bool($enable_db_auth_attr) {
    $enable_db_auth_attr_real = $enable_db_auth_attr
  } else {
    $enable_db_auth_attr_real = $enable_db_auth_attr ? {
      'USE_DEFAULTS' => $enable_db_auth_attr_default,
      default        => str2bool($enable_db_auth_attr)
    }
  }

  if is_bool($enable_db_bootparams) {
    $enable_db_bootparams_real = $enable_db_bootparams
  } else {
    $enable_db_bootparams_real = $enable_db_bootparams ? {
      'USE_DEFAULTS' => $enable_db_bootparams_default,
      default        => str2bool($enable_db_bootparams)
    }
  }

  if is_bool($enable_db_ethers) {
    $enable_db_ethers_real = $enable_db_ethers
  } else {
    $enable_db_ethers_real = $enable_db_ethers ? {
      'USE_DEFAULTS' => $enable_db_ethers_default,
      default        => str2bool($enable_db_ethers)
    }
  }

  if is_bool($enable_db_exec_attr) {
    $enable_db_exec_attr_real = $enable_db_exec_attr
  } else {
    $enable_db_exec_attr_real = $enable_db_exec_attr ? {
      'USE_DEFAULTS' => $enable_db_exec_attr_default,
      default        => str2bool($enable_db_exec_attr)
    }
  }

  if is_bool($enable_db_ipnodes) {
    $enable_db_ipnodes_real = $enable_db_ipnodes
  } else {
    $enable_db_ipnodes_real = $enable_db_ipnodes ? {
      'USE_DEFAULTS' => $enable_db_ipnodes_default,
      default        => str2bool($enable_db_ipnodes)
    }
  }

  if is_bool($enable_db_netmasks) {
    $enable_db_netmasks_real = $enable_db_netmasks
  } else {
    $enable_db_netmasks_real = $enable_db_netmasks ? {
      'USE_DEFAULTS' => $enable_db_netmasks_default,
      default        => str2bool($enable_db_netmasks)
    }
  }

  if is_bool($enable_db_networks) {
    $enable_db_networks_real = $enable_db_networks
  } else {
    $enable_db_networks_real = $enable_db_networks ? {
      'USE_DEFAULTS' => $enable_db_networks_default,
      default        => str2bool($enable_db_networks)
    }
  }

  if is_bool($enable_db_printers) {
    $enable_db_printers_real = $enable_db_printers
  } else {
    $enable_db_printers_real = $enable_db_printers ? {
      'USE_DEFAULTS' => $enable_db_printers_default,
      default        => str2bool($enable_db_printers)
    }
  }

  if is_bool($enable_db_prof_attr) {
    $enable_db_prof_attr_real = $enable_db_prof_attr
  } else {
    $enable_db_prof_attr_real = $enable_db_prof_attr ? {
      'USE_DEFAULTS' => $enable_db_prof_attr_default,
      default        => str2bool($enable_db_prof_attr)
    }
  }

  if is_bool($enable_db_project) {
    $enable_db_project_real = $enable_db_project
  } else {
    $enable_db_project_real = $enable_db_project ? {
      'USE_DEFAULTS' => $enable_db_project_default,
      default        => str2bool($enable_db_project)
    }
  }

  if is_bool($enable_db_protocols) {
    $enable_db_protocols_real = $enable_db_protocols
  } else {
    $enable_db_protocols_real = $enable_db_protocols ? {
      'USE_DEFAULTS' => $enable_db_protocols_default,
      default        => str2bool($enable_db_protocols)
    }
  }

  if is_bool($enable_db_rpc) {
    $enable_db_rpc_real = $enable_db_rpc
  } else {
    $enable_db_rpc_real = $enable_db_rpc ? {
      'USE_DEFAULTS' => $enable_db_rpc_default,
      default        => str2bool($enable_db_rpc)
    }
  }

  if is_bool($enable_db_tnrhdb) {
    $enable_db_tnrhdb_real = $enable_db_tnrhdb
  } else {
    $enable_db_tnrhdb_real = $enable_db_tnrhdb ? {
      'USE_DEFAULTS' => $enable_db_tnrhdb_default,
      default        => str2bool($enable_db_tnrhdb)
    }
  }

  if is_bool($enable_db_tnrhtp) {
    $enable_db_tnrhtp_real = $enable_db_tnrhtp
  } else {
    $enable_db_tnrhtp_real = $enable_db_tnrhtp ? {
      'USE_DEFAULTS' => $enable_db_tnrhtp_default,
      default        => str2bool($enable_db_tnrhtp)
    }
  }

  if is_bool($enable_db_user_attr) {
    $enable_db_user_attr_real = $enable_db_user_attr
  } else {
    $enable_db_user_attr_real = $enable_db_user_attr ? {
      'USE_DEFAULTS' => $enable_db_user_attr_default,
      default        => str2bool($enable_db_user_attr)
    }
  }

  if is_bool($enable_opt_auto_propagate) {
    $enable_opt_auto_propagate_real = $enable_opt_auto_propagate
  } else {
    $enable_opt_auto_propagate_real = $enable_opt_auto_propagate ? {
      'USE_DEFAULTS' => $enable_opt_auto_propagate_default,
      default        => str2bool($enable_opt_auto_propagate)
    }
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

  validate_re($netgroup_enable_cache, '^(yes|no)$',
    "nscd::netgroup_enable_cache is <${netgroup_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($netgroup_positive_time_to_live, '^(\d)+$',
    "nscd::netgroup_positive_time_to_live is <${netgroup_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($netgroup_negative_time_to_live, '^(\d)+$',
    "nscd::netgroup_negative_time_to_live is <${netgroup_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($netgroup_suggested_size, '^(\d)+$',
    "nscd::netgroup_suggested_size is <${netgroup_suggested_size}>. Must be a number.")
  validate_re($netgroup_check_files, '^(yes|no)$',
    "nscd::netgroup_check_files is <${netgroup_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($netgroup_persistent, '^(yes|no)$',
    "nscd::netgroup_persistent is <${netgroup_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($netgroup_shared, '^(yes|no)$',
    "nscd::netgroup_shared is <${netgroup_shared}>. Must be either 'yes' or 'no'.")
  validate_re($netgroup_max_db_size, '^(\d)+$',
    "nscd::netgroup_max_db_size is <${netgroup_max_db_size}>. Must be a number in bytes.")

  validate_re($audit_user_enable_cache, '^(yes|no)$',
    "nscd::audit_user_enable_cache is <${audit_user_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($audit_user_positive_time_to_live, '^(\d)+$',
    "nscd::audit_user_positive_time_to_live is <${audit_user_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($audit_user_negative_time_to_live, '^(\d)+$',
    "nscd::audit_user_negative_time_to_live is <${audit_user_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($audit_user_suggested_size, '^(\d)+$',
    "nscd::audit_user_suggested_size is <${audit_user_suggested_size}>. Must be a number.")
  validate_re($audit_user_check_files, '^(yes|no)$',
    "nscd::audit_user_check_files is <${audit_user_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($audit_user_persistent, '^(yes|no)$',
    "nscd::audit_user_persistent is <${audit_user_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($audit_user_shared, '^(yes|no)$',
    "nscd::audit_user_shared is <${audit_user_shared}>. Must be either 'yes' or 'no'.")
  validate_re($audit_user_max_db_size, '^(\d)+$',
    "nscd::audit_user_max_db_size is <${audit_user_max_db_size}>. Must be a number in bytes.")

  validate_re($auth_attr_enable_cache, '^(yes|no)$',
    "nscd::auth_attr_enable_cache is <${auth_attr_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($auth_attr_positive_time_to_live, '^(\d)+$',
    "nscd::auth_attr_positive_time_to_live is <${auth_attr_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($auth_attr_negative_time_to_live, '^(\d)+$',
    "nscd::auth_attr_negative_time_to_live is <${auth_attr_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($auth_attr_suggested_size, '^(\d)+$',
    "nscd::auth_attr_suggested_size is <${auth_attr_suggested_size}>. Must be a number.")
  validate_re($auth_attr_check_files, '^(yes|no)$',
    "nscd::auth_attr_check_files is <${auth_attr_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($auth_attr_persistent, '^(yes|no)$',
    "nscd::auth_attr_persistent is <${auth_attr_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($auth_attr_shared, '^(yes|no)$',
    "nscd::auth_attr_shared is <${auth_attr_shared}>. Must be either 'yes' or 'no'.")
  validate_re($auth_attr_max_db_size, '^(\d)+$',
    "nscd::auth_attr_max_db_size is <${auth_attr_max_db_size}>. Must be a number in bytes.")

  validate_re($bootparams_enable_cache, '^(yes|no)$',
    "nscd::bootparams_enable_cache is <${bootparams_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($bootparams_positive_time_to_live, '^(\d)+$',
    "nscd::bootparams_positive_time_to_live is <${bootparams_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($bootparams_negative_time_to_live, '^(\d)+$',
    "nscd::bootparams_negative_time_to_live is <${bootparams_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($bootparams_suggested_size, '^(\d)+$',
    "nscd::bootparams_suggested_size is <${bootparams_suggested_size}>. Must be a number.")
  validate_re($bootparams_check_files, '^(yes|no)$',
    "nscd::bootparams_check_files is <${bootparams_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($bootparams_persistent, '^(yes|no)$',
    "nscd::bootparams_persistent is <${bootparams_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($bootparams_shared, '^(yes|no)$',
    "nscd::bootparams_shared is <${bootparams_shared}>. Must be either 'yes' or 'no'.")
  validate_re($bootparams_max_db_size, '^(\d)+$',
    "nscd::bootparams_max_db_size is <${bootparams_max_db_size}>. Must be a number in bytes.")

  validate_re($ethers_enable_cache, '^(yes|no)$',
    "nscd::ethers_enable_cache is <${ethers_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($ethers_positive_time_to_live, '^(\d)+$',
    "nscd::ethers_positive_time_to_live is <${ethers_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($ethers_negative_time_to_live, '^(\d)+$',
    "nscd::ethers_negative_time_to_live is <${ethers_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($ethers_suggested_size, '^(\d)+$',
    "nscd::ethers_suggested_size is <${ethers_suggested_size}>. Must be a number.")
  validate_re($ethers_check_files, '^(yes|no)$',
    "nscd::ethers_check_files is <${ethers_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($ethers_persistent, '^(yes|no)$',
    "nscd::ethers_persistent is <${ethers_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($ethers_shared, '^(yes|no)$',
    "nscd::ethers_shared is <${ethers_shared}>. Must be either 'yes' or 'no'.")
  validate_re($ethers_max_db_size, '^(\d)+$',
    "nscd::ethers_max_db_size is <${ethers_max_db_size}>. Must be a number in bytes.")

  validate_re($exec_attr_enable_cache, '^(yes|no)$',
    "nscd::exec_attr_enable_cache is <${exec_attr_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($exec_attr_positive_time_to_live, '^(\d)+$',
    "nscd::exec_attr_positive_time_to_live is <${exec_attr_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($exec_attr_negative_time_to_live, '^(\d)+$',
    "nscd::exec_attr_negative_time_to_live is <${exec_attr_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($exec_attr_suggested_size, '^(\d)+$',
    "nscd::exec_attr_suggested_size is <${exec_attr_suggested_size}>. Must be a number.")
  validate_re($exec_attr_check_files, '^(yes|no)$',
    "nscd::exec_attr_check_files is <${exec_attr_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($exec_attr_persistent, '^(yes|no)$',
    "nscd::exec_attr_persistent is <${exec_attr_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($exec_attr_shared, '^(yes|no)$',
    "nscd::exec_attr_shared is <${exec_attr_shared}>. Must be either 'yes' or 'no'.")
  validate_re($exec_attr_max_db_size, '^(\d)+$',
    "nscd::exec_attr_max_db_size is <${exec_attr_max_db_size}>. Must be a number in bytes.")

  validate_re($ipnodes_enable_cache, '^(yes|no)$',
    "nscd::ipnodes_enable_cache is <${ipnodes_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($ipnodes_positive_time_to_live, '^(\d)+$',
    "nscd::ipnodes_positive_time_to_live is <${ipnodes_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($ipnodes_negative_time_to_live, '^(\d)+$',
    "nscd::ipnodes_negative_time_to_live is <${ipnodes_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($ipnodes_suggested_size, '^(\d)+$',
    "nscd::ipnodes_suggested_size is <${ipnodes_suggested_size}>. Must be a number.")
  validate_re($ipnodes_check_files, '^(yes|no)$',
    "nscd::ipnodes_check_files is <${ipnodes_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($ipnodes_persistent, '^(yes|no)$',
    "nscd::ipnodes_persistent is <${ipnodes_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($ipnodes_shared, '^(yes|no)$',
    "nscd::ipnodes_shared is <${ipnodes_shared}>. Must be either 'yes' or 'no'.")
  validate_re($ipnodes_max_db_size, '^(\d)+$',
    "nscd::ipnodes_max_db_size is <${ipnodes_max_db_size}>. Must be a number in bytes.")

  validate_re($netmasks_enable_cache, '^(yes|no)$',
    "nscd::netmasks_enable_cache is <${netmasks_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($netmasks_positive_time_to_live, '^(\d)+$',
    "nscd::netmasks_positive_time_to_live is <${netmasks_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($netmasks_negative_time_to_live, '^(\d)+$',
    "nscd::netmasks_negative_time_to_live is <${netmasks_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($netmasks_suggested_size, '^(\d)+$',
    "nscd::netmasks_suggested_size is <${netmasks_suggested_size}>. Must be a number.")
  validate_re($netmasks_check_files, '^(yes|no)$',
    "nscd::netmasks_check_files is <${netmasks_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($netmasks_persistent, '^(yes|no)$',
    "nscd::netmasks_persistent is <${netmasks_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($netmasks_shared, '^(yes|no)$',
    "nscd::netmasks_shared is <${netmasks_shared}>. Must be either 'yes' or 'no'.")
  validate_re($netmasks_max_db_size, '^(\d)+$',
    "nscd::netmasks_max_db_size is <${netmasks_max_db_size}>. Must be a number in bytes.")

  validate_re($networks_enable_cache, '^(yes|no)$',
    "nscd::networks_enable_cache is <${networks_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($networks_positive_time_to_live, '^(\d)+$',
    "nscd::networks_positive_time_to_live is <${networks_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($networks_negative_time_to_live, '^(\d)+$',
    "nscd::networks_negative_time_to_live is <${networks_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($networks_suggested_size, '^(\d)+$',
    "nscd::networks_suggested_size is <${networks_suggested_size}>. Must be a number.")
  validate_re($networks_check_files, '^(yes|no)$',
    "nscd::networks_check_files is <${networks_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($networks_persistent, '^(yes|no)$',
    "nscd::networks_persistent is <${networks_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($networks_shared, '^(yes|no)$',
    "nscd::networks_shared is <${networks_shared}>. Must be either 'yes' or 'no'.")
  validate_re($networks_max_db_size, '^(\d)+$',
    "nscd::networks_max_db_size is <${networks_max_db_size}>. Must be a number in bytes.")

  validate_re($printers_enable_cache, '^(yes|no)$',
    "nscd::printers_enable_cache is <${printers_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($printers_positive_time_to_live, '^(\d)+$',
    "nscd::printers_positive_time_to_live is <${printers_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($printers_negative_time_to_live, '^(\d)+$',
    "nscd::printers_negative_time_to_live is <${printers_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($printers_suggested_size, '^(\d)+$',
    "nscd::printers_suggested_size is <${printers_suggested_size}>. Must be a number.")
  validate_re($printers_check_files, '^(yes|no)$',
    "nscd::printers_check_files is <${printers_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($printers_persistent, '^(yes|no)$',
    "nscd::printers_persistent is <${printers_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($printers_shared, '^(yes|no)$',
    "nscd::printers_shared is <${printers_shared}>. Must be either 'yes' or 'no'.")
  validate_re($printers_max_db_size, '^(\d)+$',
    "nscd::printers_max_db_size is <${printers_max_db_size}>. Must be a number in bytes.")

  validate_re($prof_attr_enable_cache, '^(yes|no)$',
    "nscd::prof_attr_enable_cache is <${prof_attr_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($prof_attr_positive_time_to_live, '^(\d)+$',
    "nscd::prof_attr_positive_time_to_live is <${prof_attr_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($prof_attr_negative_time_to_live, '^(\d)+$',
    "nscd::prof_attr_negative_time_to_live is <${prof_attr_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($prof_attr_suggested_size, '^(\d)+$',
    "nscd::prof_attr_suggested_size is <${prof_attr_suggested_size}>. Must be a number.")
  validate_re($prof_attr_check_files, '^(yes|no)$',
    "nscd::prof_attr_check_files is <${prof_attr_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($prof_attr_persistent, '^(yes|no)$',
    "nscd::prof_attr_persistent is <${prof_attr_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($prof_attr_shared, '^(yes|no)$',
    "nscd::prof_attr_shared is <${prof_attr_shared}>. Must be either 'yes' or 'no'.")
  validate_re($prof_attr_max_db_size, '^(\d)+$',
    "nscd::prof_attr_max_db_size is <${prof_attr_max_db_size}>. Must be a number in bytes.")

  validate_re($project_enable_cache, '^(yes|no)$',
    "nscd::project_enable_cache is <${project_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($project_positive_time_to_live, '^(\d)+$',
    "nscd::project_positive_time_to_live is <${project_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($project_negative_time_to_live, '^(\d)+$',
    "nscd::project_negative_time_to_live is <${project_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($project_suggested_size, '^(\d)+$',
    "nscd::project_suggested_size is <${project_suggested_size}>. Must be a number.")
  validate_re($project_check_files, '^(yes|no)$',
    "nscd::project_check_files is <${project_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($project_persistent, '^(yes|no)$',
    "nscd::project_persistent is <${project_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($project_shared, '^(yes|no)$',
    "nscd::project_shared is <${project_shared}>. Must be either 'yes' or 'no'.")
  validate_re($project_max_db_size, '^(\d)+$',
    "nscd::project_max_db_size is <${project_max_db_size}>. Must be a number in bytes.")

  validate_re($protocols_enable_cache, '^(yes|no)$',
    "nscd::protocols_enable_cache is <${protocols_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($protocols_positive_time_to_live, '^(\d)+$',
    "nscd::protocols_positive_time_to_live is <${protocols_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($protocols_negative_time_to_live, '^(\d)+$',
    "nscd::protocols_negative_time_to_live is <${protocols_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($protocols_suggested_size, '^(\d)+$',
    "nscd::protocols_suggested_size is <${protocols_suggested_size}>. Must be a number.")
  validate_re($protocols_check_files, '^(yes|no)$',
    "nscd::protocols_check_files is <${protocols_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($protocols_persistent, '^(yes|no)$',
    "nscd::protocols_persistent is <${protocols_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($protocols_shared, '^(yes|no)$',
    "nscd::protocols_shared is <${protocols_shared}>. Must be either 'yes' or 'no'.")
  validate_re($protocols_max_db_size, '^(\d)+$',
    "nscd::protocols_max_db_size is <${protocols_max_db_size}>. Must be a number in bytes.")

  validate_re($rpc_enable_cache, '^(yes|no)$',
    "nscd::rpc_enable_cache is <${rpc_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($rpc_positive_time_to_live, '^(\d)+$',
    "nscd::rpc_positive_time_to_live is <${rpc_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($rpc_negative_time_to_live, '^(\d)+$',
    "nscd::rpc_negative_time_to_live is <${rpc_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($rpc_suggested_size, '^(\d)+$',
    "nscd::rpc_suggested_size is <${rpc_suggested_size}>. Must be a number.")
  validate_re($rpc_check_files, '^(yes|no)$',
    "nscd::rpc_check_files is <${rpc_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($rpc_persistent, '^(yes|no)$',
    "nscd::rpc_persistent is <${rpc_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($rpc_shared, '^(yes|no)$',
    "nscd::rpc_shared is <${rpc_shared}>. Must be either 'yes' or 'no'.")
  validate_re($rpc_max_db_size, '^(\d)+$',
    "nscd::rpc_max_db_size is <${rpc_max_db_size}>. Must be a number in bytes.")

  validate_re($tnrhdb_enable_cache, '^(yes|no)$',
    "nscd::tnrhdb_enable_cache is <${tnrhdb_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhdb_positive_time_to_live, '^(\d)+$',
    "nscd::tnrhdb_positive_time_to_live is <${tnrhdb_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($tnrhdb_negative_time_to_live, '^(\d)+$',
    "nscd::tnrhdb_negative_time_to_live is <${tnrhdb_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($tnrhdb_suggested_size, '^(\d)+$',
    "nscd::tnrhdb_suggested_size is <${tnrhdb_suggested_size}>. Must be a number.")
  validate_re($tnrhdb_check_files, '^(yes|no)$',
    "nscd::tnrhdb_check_files is <${tnrhdb_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhdb_persistent, '^(yes|no)$',
    "nscd::tnrhdb_persistent is <${tnrhdb_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhdb_shared, '^(yes|no)$',
    "nscd::tnrhdb_shared is <${tnrhdb_shared}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhdb_max_db_size, '^(\d)+$',
    "nscd::tnrhdb_max_db_size is <${tnrhdb_max_db_size}>. Must be a number in bytes.")

  validate_re($tnrhtp_enable_cache, '^(yes|no)$',
    "nscd::tnrhtp_enable_cache is <${tnrhtp_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhtp_positive_time_to_live, '^(\d)+$',
    "nscd::tnrhtp_positive_time_to_live is <${tnrhtp_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($tnrhtp_negative_time_to_live, '^(\d)+$',
    "nscd::tnrhtp_negative_time_to_live is <${tnrhtp_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($tnrhtp_suggested_size, '^(\d)+$',
    "nscd::tnrhtp_suggested_size is <${tnrhtp_suggested_size}>. Must be a number.")
  validate_re($tnrhtp_check_files, '^(yes|no)$',
    "nscd::tnrhtp_check_files is <${tnrhtp_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhtp_persistent, '^(yes|no)$',
    "nscd::tnrhtp_persistent is <${tnrhtp_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhtp_shared, '^(yes|no)$',
    "nscd::tnrhtp_shared is <${tnrhtp_shared}>. Must be either 'yes' or 'no'.")
  validate_re($tnrhtp_max_db_size, '^(\d)+$',
    "nscd::tnrhtp_max_db_size is <${tnrhtp_max_db_size}>. Must be a number in bytes.")

  validate_re($user_attr_enable_cache, '^(yes|no)$',
    "nscd::user_attr_enable_cache is <${user_attr_enable_cache}>. Must be either 'yes' or 'no'.")
  validate_re($user_attr_positive_time_to_live, '^(\d)+$',
    "nscd::user_attr_positive_time_to_live is <${user_attr_positive_time_to_live}>. Must be a number in seconds.")
  validate_re($user_attr_negative_time_to_live, '^(\d)+$',
    "nscd::user_attr_negative_time_to_live is <${user_attr_negative_time_to_live}>. Must be a number in seconds.")
  validate_re($user_attr_suggested_size, '^(\d)+$',
    "nscd::user_attr_suggested_size is <${user_attr_suggested_size}>. Must be a number.")
  validate_re($user_attr_check_files, '^(yes|no)$',
    "nscd::user_attr_check_files is <${user_attr_check_files}>. Must be either 'yes' or 'no'.")
  validate_re($user_attr_persistent, '^(yes|no)$',
    "nscd::user_attr_persistent is <${user_attr_persistent}>. Must be either 'yes' or 'no'.")
  validate_re($user_attr_shared, '^(yes|no)$',
    "nscd::user_attr_shared is <${user_attr_shared}>. Must be either 'yes' or 'no'.")
  validate_re($user_attr_max_db_size, '^(\d)+$',
    "nscd::user_attr_max_db_size is <${user_attr_max_db_size}>. Must be a number in bytes.")

  validate_bool($enable_db_passwd_real)
  validate_bool($enable_db_group_real)
  validate_bool($enable_db_hosts_real)
  validate_bool($enable_db_services_real)
  validate_bool($enable_db_netgroup_real)
  validate_bool($enable_db_audit_user_real)
  validate_bool($enable_db_auth_attr_real)
  validate_bool($enable_db_bootparams_real)
  validate_bool($enable_db_ethers_real)
  validate_bool($enable_db_exec_attr_real)
  validate_bool($enable_db_ipnodes_real)
  validate_bool($enable_db_netmasks_real)
  validate_bool($enable_db_networks_real)
  validate_bool($enable_db_printers_real)
  validate_bool($enable_db_prof_attr_real)
  validate_bool($enable_db_project_real)
  validate_bool($enable_db_protocols_real)
  validate_bool($enable_db_rpc_real)
  validate_bool($enable_db_tnrhdb_real)
  validate_bool($enable_db_tnrhtp_real)
  validate_bool($enable_db_user_attr_real)
  validate_bool($enable_opt_auto_propagate_real)

  package { $package_name_real:
    ensure    => $package_ensure,
    source    => $package_source_real,
    adminfile => $package_adminfile_real,
  }

  file { 'nscd_config':
    ensure  => file,
    path    => $config_path,
    content => template('nscd/nscd.conf.erb'),
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    require => Package[$package_name_real],
  }

  service { 'nscd_service':
    ensure    => $service_ensure,
    name      => $service_name_real,
    enable    => $service_enable_real,
    provider  => $service_provider_real,
    subscribe => File['nscd_config'],
  }
}
