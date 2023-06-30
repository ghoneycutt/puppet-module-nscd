# == Class: nscd
# @summary Class to manage nscd, Linuxs Name Service Cache Daemon.
#
#   Recommend reading the man page, NSCD.CONF(5). This module allows for
#   parameterization of all options specified in the man page.
#
#   The module assumes that you want to set enable-cache to true for each of the
#   services (passwd, group, hosts, and services). If this is not the case, you can
#   disable the cache on a per service basis.
#
#   To use this module simply `include ::nscd`
#
#   Compatibility
#   -------------
#   This module has been tested to work on the following systems:
#     * Amazon Linux 2015
#     * Amazon Linux 2016
#     * Amazon Linux 2017
#     * Debian 6
#     * EL 5
#     * EL 6
#     * EL 7
#     * EL 8
#     * Solaris 10
#     * Suse 10
#     * Suse 11
#     * Suse 12
#     * Suse 15
#     * OpenSuse 13.1
#     * Ubuntu 12.04 LTS
#
#   Compatibility with Dell Authentication Services
#   -----------------------------------------------
#   When using nscd in combination with Dell Authentication Services (QAS/VAS) [1]
#   it is recommended to turn off caching of passwd and groups.
#
#   <pre>
#   nscd::passwd_enable_cache: 'no'
#   nscd::group_enable_cache:  'no'
#   </pre>
#
#   [1] http://software.dell.com/products/authentication-services/
#
# @param audit_user_check_files
#   Settings for check-files audit_user in nscd.conf.
#
# @param audit_user_enable_cache
#   Settings for enable-cache audit_user in nscd.conf.
#
# @param audit_user_keep_hot_count
#   Settings for keep-hot-count audit_user in nscd.conf.
#
# @param audit_user_negative_time_to_live
#   Settings for negative-time-to-live audit_user in nscd.conf.
#
# @param audit_user_positive_time_to_live
#   Settings for positive-time-to-live audit_user in nscd.conf.
#
# @param auth_attr_check_files
#   Settings for check-files auth_attr in nscd.conf.
#
# @param auth_attr_enable_cache
#   Settings for enable-cache auth_attr in nscd.conf.
#
# @param auth_attr_keep_hot_count
#   Settings for keep-hot-count auth_attr in nscd.conf.
#
# @param auth_attr_negative_time_to_live
#   Settings for negative-time-to-live auth_attr in nscd.conf. Must be a number in seconds.
#
# @param auth_attr_positive_time_to_live
#   Settings for positive-time-to-live auth_attr in nscd.conf. Must be a number in seconds.
#
# @param bootparams_check_files
#   Settings for check-files bootparams in nscd.conf.
#
# @param bootparams_enable_cache
#   Settings for enable-cache bootparams in nscd.conf.
#
# @param bootparams_keep_hot_count
#   Settings for keep-hot-count bootparams in nscd.conf.
#
# @param bootparams_negative_time_to_live
#   Settings for negative-time-to-live bootparams in nscd.conf. Must be a number in seconds.
#
# @param bootparams_positive_time_to_live
#   Settings for positive-time-to-live bootparams in nscd.conf. Must be a number in seconds.
#
# @param config_group
#   Group of nscd.conf.
#
# @param config_mode
#   Mode of nscd.conf.
#
# @param config_path
#   Path to nscd.conf.
#
# @param config_owner
#   Owner of nscd.conf.
#
# @param debug_level
#   Setting for debug-level in nscd.conf.  See nscd.conf(5).
#
# @param enable_db_audit_user
#   Settings for enable_db_audit_user in nscd.conf.
#
# @param enable_db_auth_attr
#   Settings for enable_db_auth_attr in nscd.conf.
#
# @param enable_db_bootparams
#   Settings for enable_db_bootparams in nscd.conf.
#
# @param enable_db_ethers
#   Settings for enable_db_ethers in nscd.conf.
#
# @param enable_db_exec_attr
#   Settings for enable_db_exec_attr in nscd.conf.
#
# @param enable_db_group
#   Switch to show group section in nscd.conf.
#
# @param enable_db_hosts
#   Switch to show hosts section in nscd.conf.
#
# @param enable_db_ipnodes
#   Settings for enable_db_ipnodes in nscd.conf.
#
# @param enable_db_netgroup
#   Switch to show netgroup section in nscd.conf.
#
# @param enable_db_netmasks
#   Settings for enable_db_netmasks in nscd.conf.
#
# @param enable_db_networks
#   Settings for enable_db_networks in nscd.conf.
#
# @param enable_db_passwd
#   Switch to show passwd section in nscd.conf.
#
# @param enable_db_printers
#   Settings for enable_db_printers in nscd.conf.
#
# @param enable_db_prof_attr
#   Settings for enable_db_prof_attr in nscd.conf.
#
# @param enable_db_project
#   Settings for enable_db_project in nscd.conf.
#
# @param enable_db_protocols
#   Settings for enable_db_protocols in nscd.conf.
#
# @param enable_db_rpc
#   Settings for enable_db_rpc in nscd.conf.
#
# @param enable_db_services
#   Switch to show services section in nscd.conf.
#
# @param enable_db_tnrhdb
#   Settings for enable_db_tnrhdb in nscd.conf.
#
# @param enable_db_tnrhtp
#   Settings for enable_db_tnrhtp in nscd.conf.
#
# @param enable_db_user_attr
#   Settings for enable_db_user_attr in nscd.conf.
#
# @param enable_opt_auto_propagate
#   Settings for enable_opt_auto_propagate in nscd.conf.
#
# @param ethers_check_files
#   Settings for check-files ethers in nscd.conf.
#
# @param ethers_enable_cache
#   Settings for enable-cache ethers in nscd.conf.
#
# @param ethers_keep_hot_count
#   Settings for keep-hot-count ethers in nscd.conf.
#
# @param ethers_negative_time_to_live
#   Settings for negative-time-to-live ethers in nscd.conf.
#
# @param ethers_positive_time_to_live
#   Settings for positive-time-to-live ethers in nscd.conf. Must be a number in seconds.
#
# @param exec_attr_check_files
#   Settings for check-files exec_attr in nscd.conf.
#
# @param exec_attr_enable_cache
#   Settings for enable-cache exec_attr in nscd.conf.
#
# @param exec_attr_keep_hot_count
#   Settings for keep-hot-count exec_attr in nscd.conf.
#
# @param exec_attr_negative_time_to_live
#   Settings for negative-time-to-live exec_attr in nscd.conf.
#
# @param exec_attr_positive_time_to_live
#   Settings for positive-time-to-live exec_attr in nscd.conf. Must be a number in seconds.
#
# @param group_auto_propagate
#   Settings for auto-propagate group in nscd.conf.
#
# @param group_check_files
#   Settings for check-files group in nscd.conf.
#
# @param group_enable_cache
#   Settings for enable-cache netgroup in nscd.conf.
#
# @param group_keep_hot_count
#   Settings for keep-hot-count group in nscd.conf.
#
# @param group_max_db_size
#   Settings for max-db-size group in nscd.conf.
#
# @param group_negative_time_to_live
#   Settings for negative-time-to-live group in nscd.conf.
#
# @param group_persistent
#   Settings for persistent group in nscd.conf.
#
# @param group_positive_time_to_live
#   Settings for positive-time-to-live group in nscd.conf. Must be a number in seconds.
#
# @param group_shared
#   Settings for shared group in nscd.conf.
#
# @param group_suggested_size
#   Settings for suggested-size group in nscd.conf.
#
# @param hosts_check_files
#   Settings for check-files hosts in nscd.conf.
#
# @param hosts_enable_cache
#   Settings for enable-cache hosts in nscd.conf.
#
# @param hosts_keep_hot_count
#   Settings for keep-hot-count hosts in nscd.conf.
#
# @param hosts_max_db_size
#   Settings for max-db-size hosts in nscd.conf. Must be a number in bytes.
#
# @param hosts_negative_time_to_live
#   Settings for negative-time-to-live hosts in nscd.conf. Must be a number in seconds.
#
# @param hosts_persistent
#   Settings for persistent hosts in nscd.conf.
#
# @param hosts_positive_time_to_live
#   Settings for positive-time-to-live hosts in nscd.conf. Must be a number in seconds.
#
# @param hosts_shared
#   Settings for shared hosts in nscd.conf.
#
# @param hosts_suggested_size
#   Settings for suggested-size hosts in nscd.conf.
#
# @param ipnodes_check_files
#   Settings for check-files ipnodes in nscd.conf.
#
# @param ipnodes_enable_cache
#   Settings for enable-cache ipnodes in nscd.conf.
#
# @param ipnodes_keep_hot_count
#   Settings for keep-hot-count ipnodes in nscd.conf.
#
# @param ipnodes_negative_time_to_live
#   Settings for negative-time-to-live ipnodes in nscd.conf. Must be a number in seconds.
#
# @param ipnodes_positive_time_to_live
#   Settings for positive-time-to-live ipnodes in nscd.conf. Must be a number in seconds.
#
# @param logfile
#   Setting for logfile in nscd.conf. See nscd.conf(5).
#
# @param max_threads
#   Setting for max-threads in nscd.conf. See nscd.conf(5).
#
# @param netgroup_check_files
#   Settings for check-files netgroup in nscd.conf.
#
# @param netgroup_enable_cache
#   Settings for enable-cache netgroup in nscd.conf.
#
# @param netgroup_max_db_size
#   Settings for max-db-size netgroup in nscd.conf. Must be a number in bytes.
#
# @param netgroup_negative_time_to_live
#   Settings for negative-time-to-live netgroup in nscd.conf. Must be a number in seconds.
#
# @param netgroup_persistent
#   Settings for persistent netgroup in nscd.conf.
#
# @param netgroup_positive_time_to_live
#   Settings for positive-time-to-live netgroup in nscd.conf. Must be a number in seconds.
#
# @param netgroup_shared
#   Settings for shared netgroup in nscd.conf.
#
# @param netgroup_suggested_size
#   Settings for suggested-size netgroup in nscd.conf.
#
# @param netmasks_check_files
#   Settings for check-files netmasks in nscd.conf.
#
# @param netmasks_enable_cache
#   Settings for enable-cache netmasks in nscd.conf.
#
# @param netmasks_keep_hot_count
#   Settings for keep-hot-count netmasks in nscd.conf.
#
# @param netmasks_negative_time_to_live
#   Settings for negative-time-to-live netmasks in nscd.conf. Must be a number in seconds.
#
# @param netmasks_positive_time_to_live
#   Settings for positive-time-to-live netmasks in nscd.conf. Must be a number in seconds.
#
# @param networks_check_files
#   Settings for check-files networks in nscd.conf.
#
# @param networks_enable_cache
#   Settings for enable-cache networks in nscd.conf.
#
# @param networks_keep_hot_count
#   Settings for keep-hot-count networks in nscd.conf.
#
# @param networks_negative_time_to_live
#   Settings for negative-time-to-live networks in nscd.conf. Must be a number in seconds.
#
# @param networks_positive_time_to_live
#   Settings for positive-time-to-live networks in nscd.conf. Must be a number in seconds.
#
# @param package_adminfile
#   Solaris specific adminfile attribute of package resource.
#
# @param package_ensure
#   Solaris specific source attribute of package resource.
#
# @param package_name
#   Array for name of package(s).
#
# @param package_source
#   Solaris specific source attribute of package resource.
#
# @param paranoia
#   Setting for paranoia in nscd.conf. See nscd.conf(5).
#
# @param passwd_auto_propagate
#   Settings for auto-propagate passwd in nscd.conf.
#
# @param passwd_check_files
#   Settings for check-files passwd in nscd.conf.
#
# @param passwd_enable_cache
#   Settings for enable-cache passwd in nscd.conf.
#
# @param passwd_keep_hot_count
#   Settings for keep-hot-count passwd in nscd.conf.
#
# @param passwd_max_db_size
#   Settings for max-db-size passwd in nscd.conf.
#
# @param passwd_negative_time_to_live
#   Settings for negative-time-to-live passwd in nscd.conf. Must be a number in seconds.
#
# @param passwd_persistent
#   Settings for persistent passwd in nscd.conf.
#
# @param passwd_positive_time_to_live
#   Settings for positive-time-to-live passwd in nscd.conf. Must be a number in seconds.
#
# @param passwd_shared
#   Settings for shared passwd in nscd.conf.
#
# @param passwd_suggested_size
#   Settings for suggested-size passwd in nscd.conf.
#
# @param printers_check_files
#   Settings for check-files printers in nscd.conf.
#
# @param printers_enable_cache
#   Settings for enable-cache printers in nscd.conf.
#
# @param printers_keep_hot_count
#   Settings for keep-hot-count printers in nscd.conf.
#
# @param printers_negative_time_to_live
#   Settings for negative-time-to-live printers in nscd.conf. Must be a number in seconds.
#
# @param printers_positive_time_to_live
#   Settings for positive-time-to-live printers in nscd.conf. Must be a number in seconds.
#
# @param prof_attr_check_files
#   Settings for check-files prof_attr in nscd.conf.
#
# @param prof_attr_enable_cache
#   Settings for enable-cache prof_attr in nscd.conf.
#
# @param prof_attr_keep_hot_count
#   Settings for keep-hot-count prof_attr in nscd.conf.
#
# @param prof_attr_negative_time_to_live
#   Settings for negative-time-to-live prof_attr in nscd.conf. Must be a number in seconds.
#
# @param prof_attr_positive_time_to_live
#   Settings for positive-time-to-live prof_attr in nscd.conf. Must be a number in seconds.
#
# @param project_check_files
#   Settings for check-files project in nscd.conf.
#
# @param project_enable_cache
#   Settings for enable-cache project in nscd.conf.
#
# @param project_keep_hot_count
#   Settings for keep-hot-count project in nscd.conf.
#
# @param project_negative_time_to_live
#   Settings for negative-time-to-live project in nscd.conf. Must be a number in seconds.
#
# @param project_positive_time_to_live
#   Settings for positive-time-to-live project in nscd.conf. Must be a number in seconds.
#
# @param protocols_check_files
#   Settings for check-files protocols in nscd.conf.
#
# @param protocols_enable_cache
#   Settings for enable-cache protocols in nscd.conf.
#
# @param protocols_keep_hot_count
#   Settings for keep-hot-count protocols in nscd.conf.
#
# @param protocols_negative_time_to_live
#   Settings for negative-time-to-live protocols in nscd.conf. Must be a number in seconds.
#
# @param protocols_positive_time_to_live
#   Settings for positive-time-to-live protocols in nscd.conf. Must be a number in seconds.
#
# @param reload_count
#   Settings for reload-count in nscd.conf. See nscd.conf(5).
#
# @param restart_interval
#   Setting for restart-interval in nscd.conf. See nscd.conf(5).
#
# @param rpc_check_files
#   Settings for check-files rpc in nscd.conf.
#
# @param rpc_enable_cache
#   Settings for enable-cache rpc in nscd.conf.
#
# @param rpc_keep_hot_count
#   Settings for keep-hot-count rpc in nscd.conf.
#
# @param rpc_negative_time_to_live
#   Settings for negative-time-to-live rpc in nscd.conf. Must be a number in seconds.
#
# @param rpc_positive_time_to_live
#   Settings for positive-time-to-live rpc in nscd.conf. Must be a number in seconds.
#
# @param server_user
#   Setting for server-user in nscd.conf. See nscd.conf(5).
#
# @param service_enable
#   Value of enable attribute of nscd service.
#   This determines if the service will start at boot or not.
#
# @param service_ensure
#   Value of ensure attribute of nscd service.
#
# @param service_name
#   Name of service(s)
#
# @param service_provider
#   String for value of the provider attribute of nscd service.
#   Specifying here will allow you to change the platforms default.
#
# @param services_check_files
#   Settings for check-files services in nscd.conf.
#
# @param services_enable_cache
#   Settings for enable-cache services in nscd.conf.
#
# @param services_keep_hot_count
#   Settings for keep-hot-count services in nscd.conf.
#
# @param services_max_db_size
#   Settings for max-db-size servicess in nscd.conf. Must be a number in bytes.
#
# @param services_negative_time_to_live
#   Settings for negative-time-to-live services in nscd.conf. Must be a number in seconds.
#
# @param services_persistent
#   Settings for persistent services in nscd.conf.
#
# @param services_positive_time_to_live
#   Settings for positive-time-to-live services in nscd.conf. Must be a number in seconds.
#
# @param services_shared
#   Settings for shared services in nscd.conf.
#
# @param services_suggested_size
#   Settings for suggested-size services in nscd.conf.
#
# @param stat_user
#   Setting for stat-user in nscd.conf. See nscd.conf(5).
#
# @param threads
#   Setting for threads in nscd.conf. See nscd.conf(5).
#
# @param tnrhdb_check_files
#   Settings for check-files tnrhdb in nscd.conf.
#
# @param tnrhdb_enable_cache
#   Settings for enable-cache tnrhdb in nscd.conf.
#
# @param tnrhdb_keep_hot_count
#   Settings for keep-hot-count tnrhdb in nscd.conf.
#
# @param tnrhdb_negative_time_to_live
#   Settings for negative-time-to-live tnrhdb in nscd.conf. Must be a number in seconds.
#
# @param tnrhdb_positive_time_to_live
#   Settings for positive-time-to-live tnrhdb in nscd.conf. Must be a number in seconds.
#
# @param tnrhtp_check_files
#   Settings for check-files tnrhdb in nscd.conf.
#
# @param tnrhtp_enable_cache
#   Settings for enable-cache tnrhdb in nscd.conf.
#
# @param tnrhtp_keep_hot_count
#   Settings for keep-hot-count tnrhdb in nscd.conf.
#
# @param tnrhtp_negative_time_to_live
#   Settings for negative-time-to-live tnrhdb in nscd.conf. Must be a number in seconds.
#
# @param tnrhtp_positive_time_to_live
#   Settings for positive-time-to-live tnrhdb in nscd.conf. Must be a number in seconds.
#
# @param user_attr_check_files
#   Settings for check-files user_attr in nscd.conf.
#
# @param user_attr_enable_cache
#   Settings for enable-cache user_attr in nscd.conf.
#
# @param user_attr_keep_hot_count
#   Settings for keep-hot-count user_attr in nscd.conf.
#
# @param user_attr_negative_time_to_live
#   Settings for negative-time-to-live user_attr in nscd.conf. Must be a number in seconds.
#
# @param user_attr_positive_time_to_live
#   Settings for positive-time-to-live user_attr in nscd.conf. Must be a number in seconds.
#
class nscd (
  Array                                  $package_name                     = ['nscd'],
  Enum['present', 'installed', 'absent'] $package_ensure                   = 'present',
  Optional[Stdlib::Absolutepath]         $package_source                   = undef,
  Optional[Stdlib::Absolutepath]         $package_adminfile                = undef,
  Stdlib::Absolutepath                   $config_path                      = '/etc/nscd.conf',
  String[1]                              $config_owner                     = 'root',
  String[1]                              $config_group                     = 'root',
  Stdlib::Filemode                       $config_mode                      = '0644',
  String[1]                              $service_name                     = 'nscd',
  Stdlib::Ensure::Service                $service_ensure                   = 'running',
  Boolean                                $service_enable                   = true,
  Optional[String[1]]                    $service_provider                 = undef,
  Stdlib::Absolutepath                   $logfile                          = '/var/log/nscd.log',
  Integer                                $threads                          = 5,
  Integer                                $max_threads                      = 32,
  Optional[String[1]]                    $server_user                      = undef,
  String[1]                              $stat_user                        = 'root',
  Integer                                $debug_level                      = 0,
  Variant[Integer, Enum['unlimited']]    $reload_count                     = 5,
  Enum['yes', 'no']                      $paranoia                         = 'no',
  Integer                                $restart_interval                 = 3600,
  Boolean                                $enable_db_passwd                 = false,
  Boolean                                $enable_db_group                  = false,
  Boolean                                $enable_db_hosts                  = false,
  Boolean                                $enable_db_services               = false,
  Boolean                                $enable_db_netgroup               = false,
  Boolean                                $enable_db_audit_user             = false,
  Boolean                                $enable_db_auth_attr              = false,
  Boolean                                $enable_db_bootparams             = false,
  Boolean                                $enable_db_ethers                 = false,
  Boolean                                $enable_db_exec_attr              = false,
  Boolean                                $enable_db_ipnodes                = false,
  Boolean                                $enable_db_netmasks               = false,
  Boolean                                $enable_db_networks               = false,
  Boolean                                $enable_db_printers               = false,
  Boolean                                $enable_db_prof_attr              = false,
  Boolean                                $enable_db_project                = false,
  Boolean                                $enable_db_protocols              = false,
  Boolean                                $enable_db_rpc                    = false,
  Boolean                                $enable_db_tnrhdb                 = false,
  Boolean                                $enable_db_tnrhtp                 = false,
  Boolean                                $enable_db_user_attr              = false,
  Boolean                                $enable_opt_auto_propagate        = false,
  Enum['yes', 'no']                      $passwd_enable_cache              = 'yes',
  Integer                                $passwd_positive_time_to_live     = 600,
  Integer                                $passwd_negative_time_to_live     = 20,
  Integer                                $passwd_keep_hot_count            = 2048,
  Integer                                $passwd_suggested_size            = 211,
  Enum['yes', 'no']                      $passwd_check_files               = 'yes',
  Enum['yes', 'no']                      $passwd_persistent                = 'yes',
  Enum['yes', 'no']                      $passwd_shared                    = 'yes',
  Integer                                $passwd_max_db_size               = 33554432,
  Enum['yes', 'no']                      $passwd_auto_propagate            = 'yes',
  Enum['yes', 'no']                      $group_enable_cache               = 'yes',
  Integer                                $group_positive_time_to_live      = 3600,
  Integer                                $group_negative_time_to_live      = 60,
  Integer                                $group_keep_hot_count             = 2048,
  Integer                                $group_suggested_size             = 211,
  Enum['yes', 'no']                      $group_check_files                = 'yes',
  Enum['yes', 'no']                      $group_persistent                 = 'yes',
  Enum['yes', 'no']                      $group_shared                     = 'yes',
  Integer                                $group_max_db_size                = 33554432,
  Enum['yes', 'no']                      $group_auto_propagate             = 'yes',
  Enum['yes', 'no']                      $hosts_enable_cache               = 'yes',
  Integer                                $hosts_positive_time_to_live      = 3600,
  Integer                                $hosts_negative_time_to_live      = 20,
  Integer                                $hosts_keep_hot_count             = 2048,
  Integer                                $hosts_suggested_size             = 211,
  Enum['yes', 'no']                      $hosts_check_files                = 'yes',
  Enum['yes', 'no']                      $hosts_persistent                 = 'yes',
  Enum['yes', 'no']                      $hosts_shared                     = 'yes',
  Integer                                $hosts_max_db_size                = 33554432,
  Enum['yes', 'no']                      $services_enable_cache            = 'yes',
  Integer                                $services_positive_time_to_live   = 28800,
  Integer                                $services_negative_time_to_live   = 20,
  Integer                                $services_keep_hot_count          = 2048,
  Integer                                $services_suggested_size          = 211,
  Enum['yes', 'no']                      $services_check_files             = 'yes',
  Enum['yes', 'no']                      $services_persistent              = 'yes',
  Enum['yes', 'no']                      $services_shared                  = 'yes',
  Integer                                $services_max_db_size             = 33554432,
  Enum['yes', 'no']                      $netgroup_enable_cache            = 'yes',
  Integer                                $netgroup_positive_time_to_live   = 28800,
  Integer                                $netgroup_negative_time_to_live   = 20,
  Integer                                $netgroup_suggested_size          = 211,
  Enum['yes', 'no']                      $netgroup_check_files             = 'yes',
  Enum['yes', 'no']                      $netgroup_persistent              = 'yes',
  Enum['yes', 'no']                      $netgroup_shared                  = 'yes',
  Integer                                $netgroup_max_db_size             = 33554432,
  Enum['yes', 'no']                      $audit_user_enable_cache          = 'yes',
  Integer                                $audit_user_positive_time_to_live = 3600,
  Integer                                $audit_user_negative_time_to_live = 20,
  Integer                                $audit_user_keep_hot_count        = 2048,
  Enum['yes', 'no']                      $audit_user_check_files           = 'yes',
  Enum['yes', 'no']                      $auth_attr_enable_cache           = 'yes',
  Integer                                $auth_attr_positive_time_to_live  = 3600,
  Integer                                $auth_attr_negative_time_to_live  = 20,
  Integer                                $auth_attr_keep_hot_count         = 2048,
  Enum['yes', 'no']                      $auth_attr_check_files            = 'yes',
  Enum['yes', 'no']                      $bootparams_enable_cache          = 'yes',
  Integer                                $bootparams_positive_time_to_live = 3600,
  Integer                                $bootparams_negative_time_to_live = 20,
  Integer                                $bootparams_keep_hot_count        = 2048,
  Enum['yes', 'no']                      $bootparams_check_files           = 'yes',
  Enum['yes', 'no']                      $ethers_enable_cache              = 'yes',
  Integer                                $ethers_positive_time_to_live     = 3600,
  Integer                                $ethers_negative_time_to_live     = 20,
  Integer                                $ethers_keep_hot_count            = 2048,
  Enum['yes', 'no']                      $ethers_check_files               = 'yes',
  Enum['yes', 'no']                      $exec_attr_enable_cache           = 'yes',
  Integer                                $exec_attr_positive_time_to_live  = 3600,
  Integer                                $exec_attr_negative_time_to_live  = 20,
  Integer                                $exec_attr_keep_hot_count         = 2048,
  Enum['yes', 'no']                      $exec_attr_check_files            = 'yes',
  Enum['yes', 'no']                      $ipnodes_enable_cache             = 'yes',
  Integer                                $ipnodes_positive_time_to_live    = 3600,
  Integer                                $ipnodes_negative_time_to_live    = 20,
  Integer                                $ipnodes_keep_hot_count           = 2048,
  Enum['yes', 'no']                      $ipnodes_check_files              = 'yes',
  Enum['yes', 'no']                      $netmasks_enable_cache            = 'yes',
  Integer                                $netmasks_positive_time_to_live   = 3600,
  Integer                                $netmasks_negative_time_to_live   = 20,
  Integer                                $netmasks_keep_hot_count          = 2048,
  Enum['yes', 'no']                      $netmasks_check_files             = 'yes',
  Enum['yes', 'no']                      $networks_enable_cache            = 'yes',
  Integer                                $networks_positive_time_to_live   = 3600,
  Integer                                $networks_negative_time_to_live   = 20,
  Integer                                $networks_keep_hot_count          = 2048,
  Enum['yes', 'no']                      $networks_check_files             = 'yes',
  Enum['yes', 'no']                      $printers_enable_cache            = 'yes',
  Integer                                $printers_positive_time_to_live   = 3600,
  Integer                                $printers_negative_time_to_live   = 20,
  Integer                                $printers_keep_hot_count          = 2048,
  Enum['yes', 'no']                      $printers_check_files             = 'yes',
  Enum['yes', 'no']                      $prof_attr_enable_cache           = 'yes',
  Integer                                $prof_attr_positive_time_to_live  = 3600,
  Integer                                $prof_attr_negative_time_to_live  = 20,
  Integer                                $prof_attr_keep_hot_count         = 2048,
  Enum['yes', 'no']                      $prof_attr_check_files            = 'yes',
  Enum['yes', 'no']                      $project_enable_cache             = 'yes',
  Integer                                $project_positive_time_to_live    = 3600,
  Integer                                $project_negative_time_to_live    = 20,
  Integer                                $project_keep_hot_count           = 2048,
  Enum['yes', 'no']                      $project_check_files              = 'yes',
  Enum['yes', 'no']                      $protocols_enable_cache           = 'yes',
  Integer                                $protocols_positive_time_to_live  = 3600,
  Integer                                $protocols_negative_time_to_live  = 20,
  Integer                                $protocols_keep_hot_count         = 2048,
  Enum['yes', 'no']                      $protocols_check_files            = 'yes',
  Enum['yes', 'no']                      $rpc_enable_cache                 = 'yes',
  Integer                                $rpc_positive_time_to_live        = 3600,
  Integer                                $rpc_negative_time_to_live        = 20,
  Integer                                $rpc_keep_hot_count               = 2048,
  Enum['yes', 'no']                      $rpc_check_files                  = 'yes',
  Enum['yes', 'no']                      $tnrhdb_enable_cache              = 'yes',
  Integer                                $tnrhdb_positive_time_to_live     = 3600,
  Integer                                $tnrhdb_negative_time_to_live     = 20,
  Integer                                $tnrhdb_keep_hot_count            = 2048,
  Enum['yes', 'no']                      $tnrhdb_check_files               = 'yes',
  Enum['yes', 'no']                      $tnrhtp_enable_cache              = 'yes',
  Integer                                $tnrhtp_positive_time_to_live     = 3600,
  Integer                                $tnrhtp_negative_time_to_live     = 20,
  Integer                                $tnrhtp_keep_hot_count            = 2048,
  Enum['yes', 'no']                      $tnrhtp_check_files               = 'yes',
  Enum['yes', 'no']                      $user_attr_enable_cache           = 'yes',
  Integer                                $user_attr_positive_time_to_live  = 3600,
  Integer                                $user_attr_negative_time_to_live  = 20,
  Integer                                $user_attr_keep_hot_count         = 2048,
  Enum['yes', 'no']                      $user_attr_check_files            = 'yes',
) {
  package { $package_name:
    ensure    => $package_ensure,
    source    => $package_source,
    adminfile => $package_adminfile,
    before    => File['nscd_config'],
  }

  file { 'nscd_config':
    ensure  => file,
    path    => $config_path,
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    content => epp('nscd/nscd.conf.epp',
      {
        logfile                          => $logfile,
        debug_level                      => $debug_level,
        threads                          => $threads,
        max_threads                      => $max_threads,
        server_user                      => $server_user,
        stat_user                        => $stat_user,
        reload_count                     => $reload_count,
        paranoia                         => $paranoia,
        restart_interval                 => $restart_interval,
        enable_opt_auto_propagate        => $enable_opt_auto_propagate,
        enable_db_passwd                 => $enable_db_passwd,
        passwd_enable_cache              => $passwd_enable_cache,
        passwd_positive_time_to_live     => $passwd_positive_time_to_live,
        passwd_negative_time_to_live     => $passwd_negative_time_to_live,
        passwd_keep_hot_count            => $passwd_keep_hot_count,
        passwd_suggested_size            => $passwd_suggested_size,
        passwd_check_files               => $passwd_check_files,
        passwd_persistent                => $passwd_persistent,
        passwd_shared                    => $passwd_shared,
        passwd_max_db_size               => $passwd_max_db_size,
        passwd_auto_propagate            => $passwd_auto_propagate,
        enable_db_group                  => $enable_db_group,
        group_enable_cache               => $group_enable_cache,
        group_positive_time_to_live      => $group_positive_time_to_live,
        group_negative_time_to_live      => $group_negative_time_to_live,
        group_keep_hot_count             => $group_keep_hot_count,
        group_suggested_size             => $group_suggested_size,
        group_check_files                => $group_check_files,
        group_persistent                 => $group_persistent,
        group_shared                     => $group_shared,
        group_max_db_size                => $group_max_db_size,
        group_auto_propagate             => $group_auto_propagate,
        enable_db_hosts                  => $enable_db_hosts,
        hosts_enable_cache               => $hosts_enable_cache,
        hosts_positive_time_to_live      => $hosts_positive_time_to_live,
        hosts_negative_time_to_live      => $hosts_negative_time_to_live,
        hosts_keep_hot_count             => $hosts_keep_hot_count,
        hosts_suggested_size             => $hosts_suggested_size,
        hosts_check_files                => $hosts_check_files,
        hosts_persistent                 => $hosts_persistent,
        hosts_shared                     => $hosts_shared,
        hosts_max_db_size                => $hosts_max_db_size,
        enable_db_services               => $enable_db_services,
        services_enable_cache            => $services_enable_cache,
        services_positive_time_to_live   => $services_positive_time_to_live,
        services_negative_time_to_live   => $services_negative_time_to_live,
        services_keep_hot_count          => $services_keep_hot_count,
        services_suggested_size          => $services_suggested_size,
        services_check_files             => $services_check_files,
        services_persistent              => $services_persistent,
        services_shared                  => $services_shared,
        services_max_db_size             => $services_max_db_size,
        enable_db_netgroup               => $enable_db_netgroup,
        netgroup_enable_cache            => $netgroup_enable_cache,
        netgroup_positive_time_to_live   => $netgroup_positive_time_to_live,
        netgroup_negative_time_to_live   => $netgroup_negative_time_to_live,
        netgroup_suggested_size          => $netgroup_suggested_size,
        netgroup_check_files             => $netgroup_check_files,
        netgroup_persistent              => $netgroup_persistent,
        netgroup_shared                  => $netgroup_shared,
        netgroup_max_db_size             => $netgroup_max_db_size,
        enable_db_audit_user             => $enable_db_audit_user,
        audit_user_enable_cache          => $audit_user_enable_cache,
        audit_user_positive_time_to_live => $audit_user_positive_time_to_live,
        audit_user_negative_time_to_live => $audit_user_negative_time_to_live,
        audit_user_keep_hot_count        => $audit_user_keep_hot_count,
        audit_user_check_files           => $audit_user_check_files,
        enable_db_auth_attr              => $enable_db_auth_attr,
        auth_attr_enable_cache           => $auth_attr_enable_cache,
        auth_attr_positive_time_to_live  => $auth_attr_positive_time_to_live,
        auth_attr_negative_time_to_live  => $auth_attr_negative_time_to_live,
        auth_attr_keep_hot_count         => $auth_attr_keep_hot_count,
        auth_attr_check_files            => $auth_attr_check_files,
        enable_db_bootparams             => $enable_db_bootparams,
        bootparams_enable_cache          => $bootparams_enable_cache,
        bootparams_positive_time_to_live => $bootparams_positive_time_to_live,
        bootparams_negative_time_to_live => $bootparams_negative_time_to_live,
        bootparams_keep_hot_count        => $bootparams_keep_hot_count,
        bootparams_check_files           => $bootparams_check_files,
        enable_db_ethers                 => $enable_db_ethers,
        ethers_enable_cache              => $ethers_enable_cache,
        ethers_positive_time_to_live     => $ethers_positive_time_to_live,
        ethers_negative_time_to_live     => $ethers_negative_time_to_live,
        ethers_keep_hot_count            => $ethers_keep_hot_count,
        ethers_check_files               => $ethers_check_files,
        enable_db_exec_attr              => $enable_db_exec_attr,
        exec_attr_enable_cache           => $exec_attr_enable_cache,
        exec_attr_positive_time_to_live  => $exec_attr_positive_time_to_live,
        exec_attr_negative_time_to_live  => $exec_attr_negative_time_to_live,
        exec_attr_keep_hot_count         => $exec_attr_keep_hot_count,
        exec_attr_check_files            => $exec_attr_check_files,
        enable_db_ipnodes                => $enable_db_ipnodes,
        ipnodes_enable_cache             => $ipnodes_enable_cache,
        ipnodes_positive_time_to_live    => $ipnodes_positive_time_to_live,
        ipnodes_negative_time_to_live    => $ipnodes_negative_time_to_live,
        ipnodes_keep_hot_count           => $ipnodes_keep_hot_count,
        ipnodes_check_files              => $ipnodes_check_files,
        enable_db_netmasks               => $enable_db_netmasks,
        netmasks_enable_cache            => $netmasks_enable_cache,
        netmasks_positive_time_to_live   => $netmasks_positive_time_to_live,
        netmasks_negative_time_to_live   => $netmasks_negative_time_to_live,
        netmasks_keep_hot_count          => $netmasks_keep_hot_count,
        netmasks_check_files             => $netmasks_check_files,
        enable_db_networks               => $enable_db_networks,
        networks_enable_cache            => $networks_enable_cache,
        networks_positive_time_to_live   => $networks_positive_time_to_live,
        networks_negative_time_to_live   => $networks_negative_time_to_live,
        networks_keep_hot_count          => $networks_keep_hot_count,
        networks_check_files             => $networks_check_files,
        enable_db_printers               => $enable_db_printers,
        printers_enable_cache            => $printers_enable_cache,
        printers_positive_time_to_live   => $printers_positive_time_to_live,
        printers_negative_time_to_live   => $printers_negative_time_to_live,
        printers_keep_hot_count          => $printers_keep_hot_count,
        printers_check_files             => $printers_check_files,
        enable_db_prof_attr              => $enable_db_prof_attr,
        prof_attr_enable_cache           => $prof_attr_enable_cache,
        prof_attr_positive_time_to_live  => $prof_attr_positive_time_to_live,
        prof_attr_negative_time_to_live  => $prof_attr_negative_time_to_live,
        prof_attr_keep_hot_count         => $prof_attr_keep_hot_count,
        prof_attr_check_files            => $prof_attr_check_files,
        enable_db_project                => $enable_db_project,
        project_enable_cache             => $project_enable_cache,
        project_positive_time_to_live    => $project_positive_time_to_live,
        project_negative_time_to_live    => $project_negative_time_to_live,
        project_keep_hot_count           => $project_keep_hot_count,
        project_check_files              => $project_check_files,
        enable_db_protocols              => $enable_db_protocols,
        protocols_enable_cache           => $protocols_enable_cache,
        protocols_positive_time_to_live  => $protocols_positive_time_to_live,
        protocols_negative_time_to_live  => $protocols_negative_time_to_live,
        protocols_keep_hot_count         => $protocols_keep_hot_count,
        protocols_check_files            => $protocols_check_files,
        enable_db_rpc                    => $enable_db_rpc,
        rpc_enable_cache                 => $rpc_enable_cache,
        rpc_positive_time_to_live        => $rpc_positive_time_to_live,
        rpc_negative_time_to_live        => $rpc_negative_time_to_live,
        rpc_keep_hot_count               => $rpc_keep_hot_count,
        rpc_check_files                  => $rpc_check_files,
        enable_db_tnrhdb                 => $enable_db_tnrhdb,
        tnrhdb_enable_cache              => $tnrhdb_enable_cache,
        tnrhdb_positive_time_to_live     => $tnrhdb_positive_time_to_live,
        tnrhdb_negative_time_to_live     => $tnrhdb_negative_time_to_live,
        tnrhdb_keep_hot_count            => $tnrhdb_keep_hot_count,
        tnrhdb_check_files               => $tnrhdb_check_files,
        enable_db_tnrhtp                 => $enable_db_tnrhtp,
        tnrhtp_enable_cache              => $tnrhtp_enable_cache,
        tnrhtp_positive_time_to_live     => $tnrhtp_positive_time_to_live,
        tnrhtp_negative_time_to_live     => $tnrhtp_negative_time_to_live,
        tnrhtp_keep_hot_count            => $tnrhtp_keep_hot_count,
        tnrhtp_check_files               => $tnrhtp_check_files,
        enable_db_user_attr              => $enable_db_user_attr,
        user_attr_enable_cache           => $user_attr_enable_cache,
        user_attr_positive_time_to_live  => $user_attr_positive_time_to_live,
        user_attr_negative_time_to_live  => $user_attr_negative_time_to_live,
        user_attr_keep_hot_count         => $user_attr_keep_hot_count,
        user_attr_check_files            => $user_attr_check_files,
      }
    ),
  }

  service { 'nscd_service':
    ensure    => $service_ensure,
    name      => $service_name,
    enable    => $service_enable,
    provider  => $service_provider,
    subscribe => File['nscd_config'],
  }
}
