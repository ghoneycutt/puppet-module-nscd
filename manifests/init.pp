# @summary This module manages nscd
#
# @example Declaring the class
#   include nscd
#
# @param packages
#
# @param packages_ensure
#
# @param packages_source
#
# @param packages_adminfile
#
# @param config_path
#
# @param config_owner
#
# @param config_group
#
# @param config_mode
#
# @param service_name
#
# @param service_ensure
#
# @param service_enable
#
# @param service_provider
#
# @param logfile
#
# @param threads
#
# @param max_threads
#
# @param server_user
#
# @param stat_user
#
# @param debug_level
#
# @param reload_count
#
# @param paranoia
#
# @param restart_interval
#
# @param enable_db_passwd
#
# @param enable_db_group
#
# @param enable_db_hosts
#
# @param enable_db_services
#
# @param enable_db_netgroup
#
# @param enable_db_audit_user
#
# @param enable_db_auth_attr
#
# @param enable_db_bootparams
#
# @param enable_db_ethers
#
# @param enable_db_exec_attr
#
# @param enable_db_ipnodes
#
# @param enable_db_netmasks
#
# @param enable_db_networks
#
# @param enable_db_printers
#
# @param enable_db_prof_attr
#
# @param enable_db_project
#
# @param enable_db_protocols
#
# @param enable_db_rpc
#
# @param enable_db_tnrhdb
#
# @param enable_db_tnrhtp
#
# @param enable_db_user_attr
#
# @param enable_opt_auto_propagate
#
# @param passwd_enable_cache
#
# @param passwd_positive_time_to_live
#
# @param passwd_negative_time_to_live
#
# @param passwd_keep_hot_count
#
# @param passwd_suggested_size
#
# @param passwd_check_files
#
# @param passwd_persistent
#
# @param passwd_shared
#
# @param passwd_max_db_size
#
# @param passwd_auto_propagate
#
# @param group_enable_cache
#
# @param group_positive_time_to_live
#
# @param group_negative_time_to_live
#
# @param group_keep_hot_count
#
# @param group_suggested_size
#
# @param group_check_files
#
# @param group_persistent
#
# @param group_shared
#
# @param group_max_db_size
#
# @param group_auto_propagate
#
# @param hosts_enable_cache
#
# @param hosts_positive_time_to_live
#
# @param hosts_negative_time_to_live
#
# @param hosts_keep_hot_count
#
# @param hosts_suggested_size
#
# @param hosts_check_files
#
# @param hosts_persistent
#
# @param hosts_shared
#
# @param hosts_max_db_size
#
# @param services_enable_cache
#
# @param services_positive_time_to_live
#
# @param services_negative_time_to_live
#
# @param services_keep_hot_count
#
# @param services_suggested_size
#
# @param services_check_files
#
# @param services_persistent
#
# @param services_shared
#
# @param services_max_db_size
#
# @param netgroup_enable_cache
#
# @param netgroup_positive_time_to_live
#
# @param netgroup_negative_time_to_live
#
# @param netgroup_suggested_size
#
# @param netgroup_check_files
#
# @param netgroup_persistent
#
# @param netgroup_shared
#
# @param netgroup_max_db_size
#
# @param audit_user_enable_cache
#
# @param audit_user_positive_time_to_live
#
# @param audit_user_negative_time_to_live
#
# @param audit_user_keep_hot_count
#
# @param audit_user_suggested_size
#
# @param audit_user_check_files
#
# @param audit_user_persistent
#
# @param audit_user_shared
#
# @param audit_user_max_db_size
#
# @param audit_user_auto_propagate
#
# @param auth_attr_enable_cache
#
# @param auth_attr_positive_time_to_live
#
# @param auth_attr_negative_time_to_live
#
# @param auth_attr_keep_hot_count
#
# @param auth_attr_suggested_size
#
# @param auth_attr_check_files
#
# @param auth_attr_persistent
#
# @param auth_attr_shared
#
# @param auth_attr_max_db_size
#
# @param auth_attr_auto_propagate
#
# @param bootparams_enable_cache
#
# @param bootparams_positive_time_to_live
#
# @param bootparams_negative_time_to_live
#
# @param bootparams_keep_hot_count
#
# @param bootparams_suggested_size
#
# @param bootparams_check_files
#
# @param bootparams_persistent
#
# @param bootparams_shared
#
# @param bootparams_max_db_size
#
# @param bootparams_auto_propagate
#
# @param ethers_enable_cache
#
# @param ethers_positive_time_to_live
#
# @param ethers_negative_time_to_live
#
# @param ethers_keep_hot_count
#
# @param ethers_suggested_size
#
# @param ethers_check_files
#
# @param ethers_persistent
#
# @param ethers_shared
#
# @param ethers_max_db_size
#
# @param ethers_auto_propagate
#
# @param exec_attr_enable_cache
#
# @param exec_attr_positive_time_to_live
#
# @param exec_attr_negative_time_to_live
#
# @param exec_attr_keep_hot_count
#
# @param exec_attr_suggested_size
#
# @param exec_attr_check_files
#
# @param exec_attr_persistent
#
# @param exec_attr_shared
#
# @param exec_attr_max_db_size
#
# @param exec_attr_auto_propagate
#
# @param ipnodes_enable_cache
#
# @param ipnodes_positive_time_to_live
#
# @param ipnodes_negative_time_to_live
#
# @param ipnodes_keep_hot_count
#
# @param ipnodes_suggested_size
#
# @param ipnodes_check_files
#
# @param ipnodes_persistent
#
# @param ipnodes_shared
#
# @param ipnodes_max_db_size
#
# @param ipnodes_auto_propagate
#
# @param netmasks_enable_cache
#
# @param netmasks_positive_time_to_live
#
# @param netmasks_negative_time_to_live
#
# @param netmasks_keep_hot_count
#
# @param netmasks_suggested_size
#
# @param netmasks_check_files
#
# @param netmasks_persistent
#
# @param netmasks_shared
#
# @param netmasks_max_db_size
#
# @param netmasks_auto_propagate
#
# @param networks_enable_cache
#
# @param networks_positive_time_to_live
#
# @param networks_negative_time_to_live
#
# @param networks_keep_hot_count
#
# @param networks_suggested_size
#
# @param networks_check_files
#
# @param networks_persistent
#
# @param networks_shared
#
# @param networks_max_db_size
#
# @param networks_auto_propagate
#
# @param printers_enable_cache
#
# @param printers_positive_time_to_live
#
# @param printers_negative_time_to_live
#
# @param printers_keep_hot_count
#
# @param printers_suggested_size
#
# @param printers_check_files
#
# @param printers_persistent
#
# @param printers_shared
#
# @param printers_max_db_size
#
# @param printers_auto_propagate
#
# @param prof_attr_enable_cache
#
# @param prof_attr_positive_time_to_live
#
# @param prof_attr_negative_time_to_live
#
# @param prof_attr_keep_hot_count
#
# @param prof_attr_suggested_size
#
# @param prof_attr_check_files
#
# @param prof_attr_persistent
#
# @param prof_attr_shared
#
# @param prof_attr_max_db_size
#
# @param prof_attr_auto_propagate
#
# @param project_enable_cache
#
# @param project_positive_time_to_live
#
# @param project_negative_time_to_live
#
# @param project_keep_hot_count
#
# @param project_suggested_size
#
# @param project_check_files
#
# @param project_persistent
#
# @param project_shared
#
# @param project_max_db_size
#
# @param project_auto_propagate
#
# @param protocols_enable_cache
#
# @param protocols_positive_time_to_live
#
# @param protocols_negative_time_to_live
#
# @param protocols_keep_hot_count
#
# @param protocols_suggested_size
#
# @param protocols_check_files
#
# @param protocols_persistent
#
# @param protocols_shared
#
# @param protocols_max_db_size
#
# @param protocols_auto_propagate
#
# @param rpc_enable_cache
#
# @param rpc_positive_time_to_live
#
# @param rpc_negative_time_to_live
#
# @param rpc_keep_hot_count
#
# @param rpc_suggested_size
#
# @param rpc_check_files
#
# @param rpc_persistent
#
# @param rpc_shared
#
# @param rpc_max_db_size
#
# @param rpc_auto_propagate
#
# @param tnrhdb_enable_cache
#
# @param tnrhdb_positive_time_to_live
#
# @param tnrhdb_negative_time_to_live
#
# @param tnrhdb_keep_hot_count
#
# @param tnrhdb_suggested_size
#
# @param tnrhdb_check_files
#
# @param tnrhdb_persistent
#
# @param tnrhdb_shared
#
# @param tnrhdb_max_db_size
#
# @param tnrhdb_auto_propagate
#
# @param tnrhtp_enable_cache
#
# @param tnrhtp_positive_time_to_live
#
# @param tnrhtp_negative_time_to_live
#
# @param tnrhtp_keep_hot_count
#
# @param tnrhtp_suggested_size
#
# @param tnrhtp_check_files
#
# @param tnrhtp_persistent
#
# @param tnrhtp_shared
#
# @param tnrhtp_max_db_size
#
# @param tnrhtp_auto_propagate
#
# @param user_attr_enable_cache
#
# @param user_attr_positive_time_to_live
#
# @param user_attr_negative_time_to_live
#
# @param user_attr_keep_hot_count
#
# @param user_attr_suggested_size
#
# @param user_attr_check_files
#
# @param user_attr_persistent
#
# @param user_attr_shared
#
# @param user_attr_max_db_size
#
# @param user_attr_auto_propagate
#
class nscd (
  Variant[Array[String[1]], String[1]] $packages = 'nscd',
  String[1] $packages_ensure = 'present',
  Optional[Stdlib::Absolutepath] $packages_source = undef,
  Optional[Stdlib::Absolutepath] $packages_adminfile = undef,
  Stdlib::Absolutepath $config_path = '/etc/nscd.conf',
  String[1] $config_owner = 'root',
  String[1] $config_group = 'root',
  Stdlib::Filemode $config_mode = '0644',
  String[1] $service_name = 'nscd',
  Stdlib::Ensure::Service $service_ensure = 'running',
  Boolean $service_enable = true,
  Optional[String[1]] $service_provider = undef,
  Stdlib::Absolutepath $logfile = '/var/log/nscd.log',
  Integer $threads = 5,
  Integer $max_threads = 32,
  Optional[String[1]] $server_user = undef,
  String[1] $stat_user = 'root',
  Integer $debug_level = 0,
  Variant[Integer, Enum['unlimited']] $reload_count = 5,
  Enum['yes', 'no'] $paranoia = 'no',
  Integer $restart_interval = 3600,
  Boolean $enable_db_passwd = false,
  Boolean $enable_db_group = false,
  Boolean $enable_db_hosts = false,
  Boolean $enable_db_services = false,
  Boolean $enable_db_netgroup = false,
  Boolean $enable_db_audit_user = false,
  Boolean $enable_db_auth_attr = false,
  Boolean $enable_db_bootparams = false,
  Boolean $enable_db_ethers = false,
  Boolean $enable_db_exec_attr = false,
  Boolean $enable_db_ipnodes = false,
  Boolean $enable_db_netmasks = false,
  Boolean $enable_db_networks = false,
  Boolean $enable_db_printers = false,
  Boolean $enable_db_prof_attr = false,
  Boolean $enable_db_project = false,
  Boolean $enable_db_protocols = false,
  Boolean $enable_db_rpc = false,
  Boolean $enable_db_tnrhdb = false,
  Boolean $enable_db_tnrhtp = false,
  Boolean $enable_db_user_attr = false,
  Boolean $enable_opt_auto_propagate = false,
  String[1] $passwd_enable_cache = 'yes',
  Integer $passwd_positive_time_to_live = 600,
  Integer $passwd_negative_time_to_live = 20,
  Integer $passwd_keep_hot_count = 2048,
  Integer $passwd_suggested_size = 211,
  String[1] $passwd_check_files = 'yes',
  String[1] $passwd_persistent = 'yes',
  String[1] $passwd_shared = 'yes',
  Integer $passwd_max_db_size = 33554432,
  String[1] $passwd_auto_propagate = 'yes',
  String[1] $group_enable_cache = 'yes',
  Integer $group_positive_time_to_live = 3600,
  Integer $group_negative_time_to_live = 60,
  Integer $group_keep_hot_count = 2048,
  Integer $group_suggested_size = 211,
  String[1] $group_check_files = 'yes',
  String[1] $group_persistent = 'yes',
  String[1] $group_shared = 'yes',
  Integer $group_max_db_size = 33554432,
  String[1] $group_auto_propagate = 'yes',
  String[1] $hosts_enable_cache = 'yes',
  Integer $hosts_positive_time_to_live = 3600,
  Integer $hosts_negative_time_to_live = 20,
  Integer $hosts_keep_hot_count = 2048,
  Integer $hosts_suggested_size = 211,
  String[1] $hosts_check_files = 'yes',
  String[1] $hosts_persistent = 'yes',
  String[1] $hosts_shared = 'yes',
  Integer $hosts_max_db_size = 33554432,
  String[1] $services_enable_cache = 'yes',
  Integer $services_positive_time_to_live = 28800,
  Integer $services_negative_time_to_live = 20,
  Integer $services_keep_hot_count = 2048,
  Integer $services_suggested_size = 211,
  String[1] $services_check_files = 'yes',
  String[1] $services_persistent = 'yes',
  String[1] $services_shared = 'yes',
  Integer $services_max_db_size = 33554432,
  String[1] $netgroup_enable_cache = 'yes',
  Integer $netgroup_positive_time_to_live = 28800,
  Integer $netgroup_negative_time_to_live = 20,
  Integer $netgroup_suggested_size = 211,
  String[1] $netgroup_check_files = 'yes',
  String[1] $netgroup_persistent = 'yes',
  String[1] $netgroup_shared = 'yes',
  Integer $netgroup_max_db_size = 33554432,
  String[1] $audit_user_enable_cache = 'yes',
  Integer $audit_user_positive_time_to_live = 3600,
  Integer $audit_user_negative_time_to_live = 20,
  Integer $audit_user_keep_hot_count = 2048,
  Integer $audit_user_suggested_size = 211,
  String[1] $audit_user_check_files = 'yes',
  String[1] $audit_user_persistent = 'yes',
  String[1] $audit_user_shared = 'yes',
  Integer $audit_user_max_db_size = 33554432,
  String[1] $audit_user_auto_propagate = 'yes',
  String[1] $auth_attr_enable_cache = 'yes',
  Integer $auth_attr_positive_time_to_live = 3600,
  Integer $auth_attr_negative_time_to_live = 20,
  Integer $auth_attr_keep_hot_count = 2048,
  Integer $auth_attr_suggested_size = 211,
  String[1] $auth_attr_check_files = 'yes',
  String[1] $auth_attr_persistent = 'yes',
  String[1] $auth_attr_shared = 'yes',
  Integer $auth_attr_max_db_size = 33554432,
  String[1] $auth_attr_auto_propagate = 'yes',
  String[1] $bootparams_enable_cache = 'yes',
  Integer $bootparams_positive_time_to_live = 3600,
  Integer $bootparams_negative_time_to_live = 20,
  Integer $bootparams_keep_hot_count = 2048,
  Integer $bootparams_suggested_size = 211,
  String[1] $bootparams_check_files = 'yes',
  String[1] $bootparams_persistent = 'yes',
  String[1] $bootparams_shared = 'yes',
  Integer $bootparams_max_db_size = 33554432,
  String[1] $bootparams_auto_propagate = 'yes',
  String[1] $ethers_enable_cache = 'yes',
  Integer $ethers_positive_time_to_live = 3600,
  Integer $ethers_negative_time_to_live = 20,
  Integer $ethers_keep_hot_count = 2048,
  Integer $ethers_suggested_size = 211,
  String[1] $ethers_check_files = 'yes',
  String[1] $ethers_persistent = 'yes',
  String[1] $ethers_shared = 'yes',
  Integer $ethers_max_db_size = 33554432,
  String[1] $ethers_auto_propagate = 'yes',
  String[1] $exec_attr_enable_cache = 'yes',
  Integer $exec_attr_positive_time_to_live = 3600,
  Integer $exec_attr_negative_time_to_live = 20,
  Integer $exec_attr_keep_hot_count = 2048,
  Integer $exec_attr_suggested_size = 211,
  String[1] $exec_attr_check_files = 'yes',
  String[1] $exec_attr_persistent = 'yes',
  String[1] $exec_attr_shared = 'yes',
  Integer $exec_attr_max_db_size = 33554432,
  String[1] $exec_attr_auto_propagate = 'yes',
  String[1] $ipnodes_enable_cache = 'yes',
  Integer $ipnodes_positive_time_to_live = 3600,
  Integer $ipnodes_negative_time_to_live = 20,
  Integer $ipnodes_keep_hot_count = 2048,
  Integer $ipnodes_suggested_size = 211,
  String[1] $ipnodes_check_files = 'yes',
  String[1] $ipnodes_persistent = 'yes',
  String[1] $ipnodes_shared = 'yes',
  Integer $ipnodes_max_db_size = 33554432,
  String[1] $ipnodes_auto_propagate = 'yes',
  String[1] $netmasks_enable_cache = 'yes',
  Integer $netmasks_positive_time_to_live = 3600,
  Integer $netmasks_negative_time_to_live = 20,
  Integer $netmasks_keep_hot_count = 2048,
  Integer $netmasks_suggested_size = 211,
  String[1] $netmasks_check_files = 'yes',
  String[1] $netmasks_persistent = 'yes',
  String[1] $netmasks_shared = 'yes',
  Integer $netmasks_max_db_size = 33554432,
  String[1] $netmasks_auto_propagate = 'yes',
  String[1] $networks_enable_cache = 'yes',
  Integer $networks_positive_time_to_live = 3600,
  Integer $networks_negative_time_to_live = 20,
  Integer $networks_keep_hot_count = 2048,
  Integer $networks_suggested_size = 211,
  String[1] $networks_check_files = 'yes',
  String[1] $networks_persistent = 'yes',
  String[1] $networks_shared = 'yes',
  Integer $networks_max_db_size = 33554432,
  String[1] $networks_auto_propagate = 'yes',
  String[1] $printers_enable_cache = 'yes',
  Integer $printers_positive_time_to_live = 3600,
  Integer $printers_negative_time_to_live = 20,
  Integer $printers_keep_hot_count = 2048,
  Integer $printers_suggested_size = 211,
  String[1] $printers_check_files = 'yes',
  String[1] $printers_persistent = 'yes',
  String[1] $printers_shared = 'yes',
  Integer $printers_max_db_size = 33554432,
  String[1] $printers_auto_propagate = 'yes',
  String[1] $prof_attr_enable_cache = 'yes',
  Integer $prof_attr_positive_time_to_live = 3600,
  Integer $prof_attr_negative_time_to_live = 20,
  Integer $prof_attr_keep_hot_count = 2048,
  Integer $prof_attr_suggested_size = 211,
  String[1] $prof_attr_check_files = 'yes',
  String[1] $prof_attr_persistent = 'yes',
  String[1] $prof_attr_shared = 'yes',
  Integer $prof_attr_max_db_size = 33554432,
  String[1] $prof_attr_auto_propagate = 'yes',
  String[1] $project_enable_cache = 'yes',
  Integer $project_positive_time_to_live = 3600,
  Integer $project_negative_time_to_live = 20,
  Integer $project_keep_hot_count = 2048,
  Integer $project_suggested_size = 211,
  String[1] $project_check_files = 'yes',
  String[1] $project_persistent = 'yes',
  String[1] $project_shared = 'yes',
  Integer $project_max_db_size = 33554432,
  String[1] $project_auto_propagate = 'yes',
  String[1] $protocols_enable_cache = 'yes',
  Integer $protocols_positive_time_to_live = 3600,
  Integer $protocols_negative_time_to_live = 20,
  Integer $protocols_keep_hot_count = 2048,
  Integer $protocols_suggested_size = 211,
  String[1] $protocols_check_files = 'yes',
  String[1] $protocols_persistent = 'yes',
  String[1] $protocols_shared = 'yes',
  Integer $protocols_max_db_size = 33554432,
  String[1] $protocols_auto_propagate = 'yes',
  String[1] $rpc_enable_cache = 'yes',
  Integer $rpc_positive_time_to_live = 3600,
  Integer $rpc_negative_time_to_live = 20,
  Integer $rpc_keep_hot_count = 2048,
  Integer $rpc_suggested_size = 211,
  String[1] $rpc_check_files = 'yes',
  String[1] $rpc_persistent = 'yes',
  String[1] $rpc_shared = 'yes',
  Integer $rpc_max_db_size = 33554432,
  String[1] $rpc_auto_propagate = 'yes',
  String[1] $tnrhdb_enable_cache = 'yes',
  Integer $tnrhdb_positive_time_to_live = 3600,
  Integer $tnrhdb_negative_time_to_live = 20,
  Integer $tnrhdb_keep_hot_count = 2048,
  Integer $tnrhdb_suggested_size = 211,
  String[1] $tnrhdb_check_files = 'yes',
  String[1] $tnrhdb_persistent = 'yes',
  String[1] $tnrhdb_shared = 'yes',
  Integer $tnrhdb_max_db_size = 33554432,
  String[1] $tnrhdb_auto_propagate = 'yes',
  String[1] $tnrhtp_enable_cache = 'yes',
  Integer $tnrhtp_positive_time_to_live = 3600,
  Integer $tnrhtp_negative_time_to_live = 20,
  Integer $tnrhtp_keep_hot_count = 2048,
  Integer $tnrhtp_suggested_size = 211,
  String[1] $tnrhtp_check_files = 'yes',
  String[1] $tnrhtp_persistent = 'yes',
  String[1] $tnrhtp_shared = 'yes',
  Integer $tnrhtp_max_db_size = 33554432,
  String[1] $tnrhtp_auto_propagate = 'yes',
  String[1] $user_attr_enable_cache = 'yes',
  Integer $user_attr_positive_time_to_live = 3600,
  Integer $user_attr_negative_time_to_live = 20,
  Integer $user_attr_keep_hot_count = 2048,
  Integer $user_attr_suggested_size = 211,
  String[1] $user_attr_check_files = 'yes',
  String[1] $user_attr_persistent = 'yes',
  String[1] $user_attr_shared = 'yes',
  Integer $user_attr_max_db_size = 33554432,
  String[1] $user_attr_auto_propagate = 'yes',
) {

#  case $facts['os']['family'] {
#    'RedHat': {
#      $default_logfile           = '/var/log/nscd.log'
#      $default_server_user       = 'nscd'
#      $package_adminfile_default = undef
#      $package_name_default      = 'nscd'
#      $package_source_default    = undef
#      $service_name_default      = 'nscd'
#      case $facts['os']['release']['major'] {
#        '5': {
#          $service_provider_default          = undef
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = false
#          $enable_db_netgroup_default        = false
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = true
#        }
#        '6': {
#          $service_provider_default          = undef
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = true
#          $enable_db_netgroup_default        = false
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = true
#        }
#        '7': {
#          $service_provider_default          = undef
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = true
#          $enable_db_netgroup_default        = true
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = true
#        }
#        # Added for Amazon Linux support
#        # Amazon Linux has 'YYYY-MM' version format
#        # https://github.com/ghoneycutt/puppet-module-nscd/issues/41
#        /^201[5-7]+$/: {
#          $service_provider_default          = undef
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = true
#          $enable_db_netgroup_default        = true
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = true
#        }
#        default: {
#          fail("Nscd is only supported on EL 5, 6, 7 and Amazon linux 2015-2017. Your operatingsystemmajrelease is identified as <${facts['os']['release']['major']}>.")
#        }
#      }
#    }
#    'Suse': {
#      $default_logfile           = '/var/log/nscd.log'
#      $package_adminfile_default = undef
#      $package_name_default      = 'nscd'
#      $package_source_default    = undef
#      $service_name_default      = 'nscd'
#      # Suse sadly do not support $::operatingsystemmajrelease.
#      # Alternative approach is to use $::operatingsystemrelease and use regex to ignore the minor number
#      case $facts['os']['release']['major'] {
#        /^10\./: {
#          $default_server_user               = undef
#          $service_provider_default          = undef
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = false
#          $enable_db_netgroup_default        = false
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = false
#        }
#        /^11\./: {
#          $default_server_user               = undef
#          $service_provider_default          = undef
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = true
#          $enable_db_netgroup_default        = false
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = true
#        }
#        /^12\./, /^13\./, /^15\./: {
#          $default_server_user               = 'nscd'
#          $service_provider_default          = 'systemd'
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = true
#          $enable_db_netgroup_default        = true
#          $enable_db_audit_user_default      = false
#          $enable_db_auth_attr_default       = false
#          $enable_db_bootparams_default      = false
#          $enable_db_ethers_default          = false
#          $enable_db_exec_attr_default       = false
#          $enable_db_ipnodes_default         = false
#          $enable_db_netmasks_default        = false
#          $enable_db_networks_default        = false
#          $enable_db_printers_default        = false
#          $enable_db_prof_attr_default       = false
#          $enable_db_project_default         = false
#          $enable_db_protocols_default       = false
#          $enable_db_rpc_default             = false
#          $enable_db_tnrhdb_default          = false
#          $enable_db_tnrhtp_default          = false
#          $enable_db_user_attr_default       = false
#          $enable_opt_auto_propagate_default = true
#        }
#        default: {
#          fail("Nscd is only supported on Suse 10, 11, 12, 13 and 15. Your operatingsystemrelease is identified as <${facts['os']['release']['major']}>.")
#        }
#      }
#    }
#    'Debian': {
#      $default_logfile                   = '/var/log/nscd.log'
#      $default_server_user               = undef
#      $service_provider_default          = undef
#      $enable_db_passwd_default          = true
#      $enable_db_group_default           = true
#      $enable_db_hosts_default           = true
#      $enable_db_services_default        = true
#      $enable_db_netgroup_default        = false
#      $enable_db_audit_user_default      = false
#      $enable_db_auth_attr_default       = false
#      $enable_db_bootparams_default      = false
#      $enable_db_ethers_default          = false
#      $enable_db_exec_attr_default       = false
#      $enable_db_ipnodes_default         = false
#      $enable_db_netmasks_default        = false
#      $enable_db_networks_default        = false
#      $enable_db_printers_default        = false
#      $enable_db_prof_attr_default       = false
#      $enable_db_project_default         = false
#      $enable_db_protocols_default       = false
#      $enable_db_rpc_default             = false
#      $enable_db_tnrhdb_default          = false
#      $enable_db_tnrhtp_default          = false
#      $enable_db_user_attr_default       = false
#      $enable_opt_auto_propagate_default = true
#      $package_adminfile_default         = undef
#      $package_name_default              = 'nscd'
#      $package_source_default            = undef
#      $service_name_default              = 'nscd'
#    }
#    'Solaris': {
#      $default_logfile           = '/var/adm/nscd.log'
#      $default_server_user       = undef
#      $package_adminfile_default = undef
#      $package_name_default      = 'SUNWcsu'
#      $package_source_default    = '/var/spool/pkg'
#      $service_provider_default  = undef
#      $service_name_default      = 'name-service-cache'
#      case $facts['kernelrelease'] {
#        '5.10': {
#          $enable_db_passwd_default          = true
#          $enable_db_group_default           = true
#          $enable_db_hosts_default           = true
#          $enable_db_services_default        = true
#          $enable_db_netgroup_default        = false
#          $enable_db_audit_user_default      = true
#          $enable_db_auth_attr_default       = true
#          $enable_db_bootparams_default      = true
#          $enable_db_ethers_default          = true
#          $enable_db_exec_attr_default       = true
#          $enable_db_ipnodes_default         = true
#          $enable_db_netmasks_default        = true
#          $enable_db_networks_default        = true
#          $enable_db_printers_default        = true
#          $enable_db_prof_attr_default       = true
#          $enable_db_project_default         = true
#          $enable_db_protocols_default       = true
#          $enable_db_rpc_default             = true
#          $enable_db_tnrhdb_default          = true
#          $enable_db_tnrhtp_default          = true
#          $enable_db_user_attr_default       = true
#          $enable_opt_auto_propagate_default = false
#        }
#        default: {
#          fail("Nscd is only supported on Solaris 5.10. Your kernelrelease is identified as <${facts['kernelrelease']}>.")
#        }
#      }
#    }
#    default: {
#      fail("Nscd supports osfamilies Debian, RedHat, Suse and Solaris. Detected osfamily is <${facts['os']['family']}>.")
#    }
#  }


  package { $packages:
    ensure    => $packages_ensure,
    source    => $packages_source,
    adminfile => $packages_adminfile,
  }

  file { 'nscd_config':
    ensure  => file,
    path    => $config_path,
    content => template('nscd/nscd.conf.erb'),
    owner   => $config_owner,
    group   => $config_group,
    mode    => $config_mode,
    require => Package[$packages],
  }

  service { 'nscd_service':
    ensure    => $service_ensure,
    name      => $service_name,
    enable    => $service_enable,
    provider  => $service_provider,
    subscribe => File['nscd_config'],
  }
}
