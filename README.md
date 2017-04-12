# puppet-module-nscd
===

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-nscd.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-nscd)

Puppet module to manage nscd, Linux's Name Service Cache Daemon.

Recommend reading the man page, NSCD.CONF(5). This module allows for
parameterization of all options specified in the man page.

The module assumes that you want to set enable-cache to true for each of the
services (passwd, group, hosts, and services). If this is not the case, you can
disable the cache on a per service basis.

To use this module simply `include ::nscd`

===

# Compatibility
---------------
This module is built for use with Puppet v3 (with and without the future
parser) and Puppet v4 on the following platforms and supports Ruby versions
1.8.7, 1.9.3, 2.0.0, 2.1.0 and 2.3.1.

* Amazon Linux 2015
* Amazon Linux 2016
* Amazon Linux 2017
* Debian 6
* EL 5
* EL 6
* EL 7
* Solaris 10
* Suse 10
* Suse 11
* Suse 12
* OpenSuse 13.1
* Ubuntu 12.04 LTS


# Compatibility with Dell Authentication Services
-------------------------------------------------
When using nscd in combination with Dell Authentication Services (QAS/VAS) [1] it is recommended to turn off caching of passwd and groups.

<pre>
nscd::passwd_enable_cache: 'no'
nscd::group_enable_cache:  'no'
</pre>

[1] http://software.dell.com/products/authentication-services/

===

# Parameters
------------
All numbers should be type cast as strings. Global options for nscd.con can be accessed as parameters, with the dashes changed to underscores. Each per service option can be accessed as parameters and follow the naming scheme of `<service>_<option>` with the dashed changed to underscores. So enable-cache for the passwd service is available as `passwd_enable_cache`. The default values follow that of the man page, unless otherwise noted.

## Resource parameters
---

package_name
------------
String or array for name of package(s). 'USE_DEFAULTS' will use platform specific defaults.

- *Default*: 'USE_DEFAULTS'

package_ensure
--------------
String for value of ensure attribute of nscd package. Valid values are 'present', 'installed', or 'absent'.

- *Default*: 'present'

package_adminfile
-----------------
String for value of Solaris specific adminfile attribute of package resource. 'USE_DEFAULTS' will use platform specific defaults.

- *Default*: 'USE_DEFAULTS'

package_source
--------------
String for value of Solaris specific source attribute of package resource. 'USE_DEFAULTS' will use platform specific defaults.

- *Default*: 'USE_DEFAULTS'

config_path
-----------
Path to nscd.conf.

- *Default*: '/etc/nscd.conf'

config_owner
------------
Owner of nscd.conf.

- *Default*: 'root'

config_group
------------
Group of nscd.conf.

- *Default*: 'root'

config_mode
-----------
Mode of nscd.conf. Must be in four digit octal notation.

- *Default*: '0644'

service_name
------------
String or array for name of service(s). 'USE_DEFAULTS' will use platform specific defaults

- *Default*: 'USE_DEFAULTS'

service_ensure
--------------
String for value of ensure attribute of nscd service. Valid values are 'present', 'running', 'absent', or 'stopped'.

- *Default*: 'running'

service_enable
--------------
Value of enable attribute of nscd service. This determines if the service will start at boot or not. Allows for boolean, 'true', or 'false'.

- *Default*: true

service_provider
----------------
String for value of the provider attribute of nscd service. Specifying here will allow you to change the platform's default.

- *Default*: 'USE_DEFAULTS'

## Global nscd.conf settings
---

logfile
-------
Setting for logfile in nscd.conf. See nscd.conf(5). Must be an absolute path.

- *Default*: 'USE_DEFAULTS'

threads
-------
Setting for threads in nscd.conf. See nscd.conf(5). Must be an number expressed as a string.

- *Default*: '5'

max_threads
-----------
Setting for max-threads in nscd.conf. See nscd.conf(5). Must be an number expressed as a string.

- *Default*: '32'

server_user
-----------
Setting for server-user in nscd.conf. See nscd.conf(5). 'USE_DEFAULTS' will use
platform specific defaults. RedHat based systems set this optional parameter to
'nscd' while other platforms do not use it.

- *Default*: 'USE_DEFAULTS'

stat_user
---------
Setting for stat-user in nscd.conf.  See nscd.conf(5).

- *Default*: 'root'

debug_level
-----------
Setting for debug-level in nscd.conf.  See nscd.conf(5). Must be a number expressed as a string.

- *Default*: '0'

reload_count
------------
Settings for reload-count in nscd.conf.  See nscd.conf(5). Must be a number expressed as a string or 'unlimited'.

- *Default*: '5'

paranoia
--------
Setting for paranoia in nscd.conf.  See nscd.conf(5). Must be 'yes' or 'no'.

- *Default*: 'no'

restart_interval
----------------
Setting for restart-interval in nscd.conf.  See nscd.conf(5). Must be a number expressed as a string.

- *Default*: '3600'

## Per service nscd.conf settings
---

enable_db_passwd
----------------
Switch to show passwd section in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS', based on OS platform

enable_db_group
---------------
Switch to show group section in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS', based on OS platform

enable_db_hosts
---------------
Switch to show hosts section in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS', based on OS platform

enable_db_services
------------------
Switch to show services section in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS', based on OS platform

enable_db_netgroup
------------------
Switch to show netgroup section in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS', based on OS platform

enable_db_audit_user
--------------------
Settings for enable_db_audit_user in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_auth_attr
-------------------
Settings for enable_db_auth_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_bootparams
--------------------
Settings for enable_db_bootparams in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_ethers
----------------
Settings for enable_db_ethers in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_exec_attr
-------------------
Settings for enable_db_exec_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_ipnodes
-----------------
Settings for enable_db_ipnodes in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_netmasks
------------------
Settings for enable_db_netmasks in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_networks
------------------
Settings for enable_db_networks in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_printers
------------------
Settings for enable_db_printers in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_prof_attr
-------------------
Settings for enable_db_prof_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_project
-----------------
Settings for enable_db_project in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_protocols
-------------------
Settings for enable_db_protocols in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_rpc
-------------
Settings for enable_db_rpc in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_tnrhdb
----------------
Settings for enable_db_tnrhdb in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_tnrhtp
----------------
Settings for enable_db_tnrhtp in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_user_attr
-------------------
Settings for enable_db_user_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_opt_auto_propagate
-------------------------
Settings for enable_opt_auto_propagate in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

passwd_enable_cache
-------------------
Settings for enable-cache passwd in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_positive_time_to_live
----------------------------
Settings for positive-time-to-live passwd in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '600'

passwd_negative_time_to_live
----------------------------
Settings for negative-time-to-live passwd in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

passwd_keep_hot_count
---------------------
Settings for keep-hot-count passwd in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

passwd_suggested_size
---------------------
Settings for suggested-size passwd in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

passwd_check_files
------------------
Settings for check-files passwd in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_persistent
-----------------
Settings for persistent passwd in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_shared
-------------
Settings for shared passwd in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_max_db_size
------------------
Settings for max-db-size passwd in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

passwd_auto_propagate
---------------------
Settings for auto-propagate passwd in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_enable_cache
------------------
Settings for enable-cache group in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_positive_time_to_live
---------------------------
Settings for positive-time-to-live group in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

group_negative_time_to_live
---------------------------
Settings for negative-time-to-live group in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '60'

group_keep_hot_count
--------------------
Settings for keep-hot-count group in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

group_suggested_size
--------------------
Settings for suggested-size group in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

group_check_files
-----------------
Settings for check-files group in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_persistent
----------------
Settings for persistent group in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_shared
------------
Settings for shared group in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_max_db_size
-----------------
Settings for max-db-size group in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

group_auto_propagate
--------------------
Settings for auto-propagate group in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_enable_cache
------------------
Settings for enable-cache hosts in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_positive_time_to_live
---------------------------
Settings for positive-time-to-live hosts in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

hosts_negative_time_to_live
---------------------------
Settings for negative-time-to-live hosts in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

hosts_keep_hot_count
--------------------
Settings for keep-hot-count hosts in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

hosts_suggested_size
--------------------
Settings for suggested-size hosts in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

hosts_check_files
-----------------
Settings for check-files hosts in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_persistent
----------------
Settings for persistent hosts in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_shared
------------
Settings for shared hosts in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_max_db_size
-----------------
Settings for max-db-size hosts in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

services_enable_cache
---------------------
Settings for enable-cache services in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_positive_time_to_live
------------------------------
Settings for positive-time-to-live services in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '28800'

services_negative_time_to_live
------------------------------
Settings for negative-time-to-live services in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

services_keep_hot_count
-----------------------
Settings for keep-hot-count services in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

services_suggested_size
-----------------------
Settings for suggested-size services in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

services_check_files
--------------------
Settings for check-files services in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_persistent
-------------------
Settings for persistent services in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_shared
---------------
Settings for shared services in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_max_db_size
--------------------
Settings for max-db-size servicess in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

netgroup_enable_cache
---------------------
Settings for enable-cache netgroup in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netgroup_positive_time_to_live
------------------------------
Settings for positive-time-to-live netgroup in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '28800'

netgroup_negative_time_to_live
------------------------------
Settings for negative-time-to-live netgroup in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

netgroup_suggested_size
-----------------------
Settings for suggested-size netgroup in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

netgroup_check_files
--------------------
Settings for check-files netgroup in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netgroup_persistent
-------------------
Settings for persistent netgroup in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netgroup_shared
---------------
Settings for shared netgroup in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netgroup_max_db_size
--------------------
Settings for max-db-size netgroup in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

audit_user_enable_cache
-----------------------
Settings for enable-cache audit_user in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_positive_time_to_live
--------------------------------
Settings for positive-time-to-live audit_user in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

audit_user_negative_time_to_live
--------------------------------
Settings for negative-time-to-live audit_user in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

audit_user_keep_hot_count
-------------------------
Settings for keep-hot-count audit_user in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

audit_user_suggested_size
-------------------------
Settings for suggested-size audit_user in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

audit_user_check_files
----------------------
Settings for check-files audit_user in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_persistent
---------------------
Settings for persistent audit_user in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_shared
-----------------
Settings for shared audit_user in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_max_db_size
----------------------
Settings for max-db-size audit_user in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

audit_user_auto_propagate
-------------------------
Settings for auto-propagate audit_user in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_enable_cache
----------------------
Settings for enable-cache auth_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_positive_time_to_live
-------------------------------
Settings for positive-time-to-live auth_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

auth_attr_negative_time_to_live
-------------------------------
Settings for negative-time-to-live auth_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

auth_attr_keep_hot_count
------------------------
Settings for keep-hot-count auth_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

auth_attr_suggested_size
------------------------
Settings for suggested-size auth_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

auth_attr_check_files
---------------------
Settings for check-files auth_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_persistent
--------------------
Settings for persistent auth_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_shared
----------------
Settings for shared auth_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_max_db_size
---------------------
Settings for max-db-size auth_attr in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

auth_attr_auto_propagate
------------------------
Settings for auto-propagate auth_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_enable_cache
-----------------------
Settings for enable-cache bootparams in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_positive_time_to_live
--------------------------------
Settings for positive-time-to-live bootparams in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

bootparams_negative_time_to_live
--------------------------------
Settings for negative-time-to-live bootparams in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

bootparams_keep_hot_count
-------------------------
Settings for keep-hot-count bootparams in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

bootparams_suggested_size
-------------------------
Settings for suggested-size bootparams in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

bootparams_check_files
----------------------
Settings for check-files bootparams in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_persistent
---------------------
Settings for persistent bootparams in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_shared
-----------------
Settings for shared bootparams in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_max_db_size
----------------------
Settings for max-db-size bootparams in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

bootparams_auto_propagate
-------------------------
Settings for auto-propagate bootparams in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_enable_cache
-------------------
Settings for enable-cache ethers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_positive_time_to_live
----------------------------
Settings for positive-time-to-live ethers in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

ethers_negative_time_to_live
----------------------------
Settings for negative-time-to-live ethers in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

ethers_keep_hot_count
---------------------
Settings for keep-hot-count ethers in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

ethers_suggested_size
---------------------
Settings for suggested-size ethers in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

ethers_check_files
------------------
Settings for check-files ethers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_persistent
-----------------
Settings for persistent ethers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_shared
-------------
Settings for shared ethers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_max_db_size
------------------
Settings for max-db-size ethers in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

ethers_auto_propagate
---------------------
Settings for auto-propagate ethers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_enable_cache
----------------------
Settings for enable-cache exec_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_positive_time_to_live
-------------------------------
Settings for positive-time-to-live exec_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

exec_attr_negative_time_to_live
-------------------------------
Settings for negative-time-to-live exec_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

exec_attr_keep_hot_count
------------------------
Settings for keep-hot-count exec_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

exec_attr_suggested_size
------------------------
Settings for suggested-size exec_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

exec_attr_check_files
---------------------
Settings for check-files exec_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_persistent
--------------------
Settings for persistent exec_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_shared
----------------
Settings for shared exec_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_max_db_size
---------------------
Settings for max-db-size exec_attr in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

exec_attr_auto_propagate
------------------------
Settings for auto-propagate exec_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_enable_cache
--------------------
Settings for enable-cache ipnodes in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_positive_time_to_live
-----------------------------
Settings for positive-time-to-live ipnodes in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

ipnodes_negative_time_to_live
-----------------------------
Settings for negative-time-to-live ipnodes in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

ipnodes_keep_hot_count
----------------------
Settings for keep-hot-count ipnodes in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

ipnodes_suggested_size
----------------------
Settings for suggested-size ipnodes in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

ipnodes_check_files
-------------------
Settings for check-files ipnodes in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_persistent
------------------
Settings for persistent ipnodes in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_shared
--------------
Settings for shared ipnodes in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_max_db_size
-------------------
Settings for max-db-size ipnodes in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

ipnodes_auto_propagate
----------------------
Settings for auto-propagate ipnodes in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_enable_cache
---------------------
Settings for enable-cache netmasks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_positive_time_to_live
------------------------------
Settings for positive-time-to-live netmasks in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

netmasks_negative_time_to_live
------------------------------
Settings for negative-time-to-live netmasks in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

netmasks_keep_hot_count
-----------------------
Settings for keep-hot-count netmasks in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

netmasks_suggested_size
-----------------------
Settings for suggested-size netmasks in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

netmasks_check_files
--------------------
Settings for check-files netmasks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_persistent
-------------------
Settings for persistent netmasks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_shared
---------------
Settings for shared netmasks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_max_db_size
--------------------
Settings for max-db-size netmasks in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

netmasks_auto_propagate
-----------------------
Settings for auto-propagate netmasks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_enable_cache
---------------------
Settings for enable-cache networks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_positive_time_to_live
------------------------------
Settings for positive-time-to-live networks in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

networks_negative_time_to_live
------------------------------
Settings for negative-time-to-live networks in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

networks_keep_hot_count
-----------------------
Settings for keep-hot-count networks in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

networks_suggested_size
-----------------------
Settings for suggested-size networks in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

networks_check_files
--------------------
Settings for check-files networks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_persistent
-------------------
Settings for persistent networks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_shared
---------------
Settings for shared networks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_max_db_size
--------------------
Settings for max-db-size networks in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

networks_auto_propagate
-----------------------
Settings for auto-propagate networks in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_enable_cache
---------------------
Settings for enable-cache printers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_positive_time_to_live
------------------------------
Settings for positive-time-to-live printers in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

printers_negative_time_to_live
------------------------------
Settings for negative-time-to-live printers in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

printers_keep_hot_count
-----------------------
Settings for keep-hot-count printers in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

printers_suggested_size
-----------------------
Settings for suggested-size printers in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

printers_check_files
--------------------
Settings for check-files printers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_persistent
-------------------
Settings for persistent printers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_shared
---------------
Settings for shared printers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_max_db_size
--------------------
Settings for max-db-size printers in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

printers_auto_propagate
-----------------------
Settings for auto-propagate printers in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_enable_cache
----------------------
Settings for enable-cache prof_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_positive_time_to_live
-------------------------------
Settings for positive-time-to-live prof_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

prof_attr_negative_time_to_live
-------------------------------
Settings for negative-time-to-live prof_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

prof_attr_keep_hot_count
------------------------
Settings for keep-hot-count prof_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

prof_attr_suggested_size
------------------------
Settings for suggested-size prof_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

prof_attr_check_files
---------------------
Settings for check-files prof_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_persistent
--------------------
Settings for persistent prof_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_shared
----------------
Settings for shared prof_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_max_db_size
---------------------
Settings for max-db-size prof_attr in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

prof_attr_auto_propagate
------------------------
Settings for auto-propagate prof_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_enable_cache
--------------------
Settings for enable-cache project in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_positive_time_to_live
-----------------------------
Settings for positive-time-to-live project in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

project_negative_time_to_live
-----------------------------
Settings for negative-time-to-live project in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

project_keep_hot_count
----------------------
Settings for keep-hot-count project in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

project_suggested_size
----------------------
Settings for suggested-size project in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

project_check_files
-------------------
Settings for check-files project in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_persistent
------------------
Settings for persistent project in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_shared
--------------
Settings for shared project in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_max_db_size
-------------------
Settings for max-db-size project in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

project_auto_propagate
----------------------
Settings for auto-propagate project in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_enable_cache
----------------------
Settings for enable-cache protocols in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_positive_time_to_live
-------------------------------
Settings for positive-time-to-live protocols in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

protocols_negative_time_to_live
-------------------------------
Settings for negative-time-to-live protocols in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

protocols_keep_hot_count
------------------------
Settings for keep-hot-count protocols in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

protocols_suggested_size
------------------------
Settings for suggested-size protocols in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

protocols_check_files
---------------------
Settings for check-files protocols in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_persistent
--------------------
Settings for persistent protocols in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_shared
----------------
Settings for shared protocols in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_max_db_size
---------------------
Settings for max-db-size protocols in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

protocols_auto_propagate
------------------------
Settings for auto-propagate protocols in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_enable_cache
----------------
Settings for enable-cache rpc in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_positive_time_to_live
-------------------------
Settings for positive-time-to-live rpc in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

rpc_negative_time_to_live
-------------------------
Settings for negative-time-to-live rpc in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

rpc_keep_hot_count
------------------
Settings for keep-hot-count rpc in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

rpc_suggested_size
------------------
Settings for suggested-size rpc in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

rpc_check_files
---------------
Settings for check-files rpc in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_persistent
--------------
Settings for persistent rpc in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_shared
----------
Settings for shared rpc in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_max_db_size
---------------
Settings for max-db-size rpc in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

rpc_auto_propagate
------------------
Settings for auto-propagate rpc in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_enable_cache
-------------------
Settings for enable-cache tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_positive_time_to_live
----------------------------
Settings for positive-time-to-live tnrhdb in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

tnrhdb_negative_time_to_live
----------------------------
Settings for negative-time-to-live tnrhdb in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

tnrhdb_keep_hot_count
---------------------
Settings for keep-hot-count tnrhdb in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

tnrhdb_suggested_size
---------------------
Settings for suggested-size tnrhdb in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

tnrhdb_check_files
------------------
Settings for check-files tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_persistent
-----------------
Settings for persistent tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_shared
-------------
Settings for shared tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_max_db_size
------------------
Settings for max-db-size tnrhdb in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

tnrhdb_auto_propagate
---------------------
Settings for auto-propagate tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_enable_cache
-------------------
Settings for enable-cache tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_positive_time_to_live
----------------------------
Settings for positive-time-to-live tnrhdb in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

tnrhtp_negative_time_to_live
----------------------------
Settings for negative-time-to-live tnrhdb in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

tnrhtp_keep_hot_count
---------------------
Settings for keep-hot-count tnrhdb in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

tnrhtp_suggested_size
---------------------
Settings for suggested-size tnrhdb in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

tnrhtp_check_files
------------------
Settings for check-files tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_persistent
-----------------
Settings for persistent tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_shared
-------------
Settings for shared tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_max_db_size
------------------
Settings for max-db-size tnrhdb in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

tnrhtp_auto_propagate
---------------------
Settings for auto-propagate tnrhdb in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_enable_cache
----------------------
Settings for enable-cache user_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_positive_time_to_live
-------------------------------
Settings for positive-time-to-live user_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '3600'

user_attr_negative_time_to_live
-------------------------------
Settings for negative-time-to-live user_attr in nscd.conf. Must be a number in seconds expressed as a string.

- *Default*: '20'

user_attr_keep_hot_count
------------------------
Settings for keep-hot-count user_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '2048'

user_attr_suggested_size
------------------------
Settings for suggested-size user_attr in nscd.conf. Must be a number expressed as a string.

- *Default*: '211'

user_attr_check_files
---------------------
Settings for check-files user_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_persistent
--------------------
Settings for persistent user_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_shared
----------------
Settings for shared user_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_max_db_size
---------------------
Settings for max-db-size user_attr in nscd.conf. Must be a number in bytes expressed as a string.

- *Default*: '33554432'

user_attr_auto_propagate
------------------------
Settings for auto-propagate user_attr in nscd.conf. Must be 'yes' or 'no'.

- *Default*: 'yes'
