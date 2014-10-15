# puppet-module-nscd
===

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-nscd.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-nscd)

Puppet module to manage nscd, Linux's Name Service Cache Daemon.

Recommend reading the man page, NSCD.CONF(5). This module allows for
parameterization of all options specified in the man page.

The module assumes that you want to set enable-cache to true for each of the
services (passwd, group, hosts, and services). If this is not the case, you can
disable the cache on a per service basis.

===

# Compatibility
---------------
This module is built for use with Puppet v3 on the following platforms and supports Ruby versions 1.8.7, 1.9.3, and 2.0.0.

* Debian 6
* EL 5
* EL 6
* Suse 10
* Suse 11
* Ubuntu 12.04 LTS
* Solaris 10

===

# Parameters
------------
All numbers should be type cast as strings. Global options for nscd.con can be accessed as parameters, with the dashes changed to underscores. Each per service option can be accessed as parameters and follow the naming scheme of `<service>_<option>` with the dashed changed to underscores. So enable-cache for the passwd service is available as `passwd_enable_cache`. The default values follow that of the man page, unless otherwise noted.

## Resource parameters
---

package_name
------------
String or array for name of package(s).

- *Default*: 'nscd'

package_ensure
--------------
String for value of ensure attribute of nscd package. Valid values are 'present', 'installed', or 'absent'.

- *Default*: 'present'

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
String or array for name of service(s).

- *Default*: 'nscd'

service_ensure
--------------
String for value of ensure attribute of nscd service. Valid values are 'present', 'running', 'absent', or 'stopped'.

- *Default*: 'running'

service_enable
--------------
Value of enable attribute of nscd service. This determines if the service will start at boot or not. Allows for boolean, 'true', or 'false'.

- *Default*: true

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
Setting for debug-level in nscd.conf.  See nscd.conf(5). Must be a number.

- *Default*: '0'

reload_count
------------
Settings for reload-count in nscd.conf.  See nscd.conf(5). Must be a number or 'unlimited'.

- *Default*: '5'

paranoia
--------
Setting for paranoia in nscd.conf.  See nscd.conf(5). Must be 'yes' or 'no'.

- *Default*: 'no'

restart_interval
----------------
Setting for restart-interval in nscd.conf.  See nscd.conf(5). Must be a number.

- *Default*: '3600'

## Per service nscd.conf settings
---

enable_db_passwd
----------------------
Settings for enable_db_passwd in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_group
----------------------
Settings for enable_db_group in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_hosts
----------------------
Settings for enable_db_hosts in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_services
----------------------
Settings for enable_db_services in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_audit_user
---------------------
Settings for enable_db_audit_user in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_auth_attr
--------------------
Settings for enable_db_auth_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_bootparams
---------------------
Settings for enable_db_bootparams in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_ethers
-----------------
Settings for enable_db_ethers in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_exec_attr
--------------------
Settings for enable_db_exec_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_ipnodes
------------------
Settings for enable_db_ipnodes in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_netmasks
-------------------
Settings for enable_db_netmasks in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_networks
-------------------
Settings for enable_db_networks in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_printers
-------------------
Settings for enable_db_printers in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_prof_attr
--------------------
Settings for enable_db_prof_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_project
------------------
Settings for enable_db_project in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_protocols
--------------------
Settings for enable_db_protocols in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_rpc
--------------
Settings for enable_db_rpc in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_tnrhdb
-----------------
Settings for enable_db_tnrhdb in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_tnrhtp
-----------------
Settings for enable_db_tnrhtp in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_db_user_attr
--------------------
Settings for enable_db_user_attr in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

enable_opt_auto_propagate
----------------------
Settings for enable_opt_auto_propagate in nscd.conf. Allows for boolean, 'true', or 'false'.

- *Default*: 'USE_DEFAULTS'

passwd_enable_cache
--------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_positive_time_to_live
-----------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

passwd_negative_time_to_live
-----------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

passwd_keep_hot_count
----------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

passwd_suggested_size
----------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

passwd_check_files
-------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_persistent
------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_shared
--------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_max_db_size
-------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

passwd_auto_propagate
----------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_enable_cache
-------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_positive_time_to_live
----------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: '3600'

group_negative_time_to_live
----------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: '60'

group_keep_hot_count
---------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

group_suggested_size
---------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

group_check_files
------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_persistent
-----------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_shared
-------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_max_db_size
------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

group_auto_propagate
---------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_enable_cache
-------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_positive_time_to_live
----------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: '3600'

hosts_negative_time_to_live
----------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

hosts_keep_hot_count
---------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

hosts_suggested_size
---------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

hosts_check_files
------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_persistent
-----------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_shared
-------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_max_db_size
------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

services_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: '28800'

services_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

services_keep_hot_count
------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

services_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

services_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

audit_user_enable_cache
------------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_positive_time_to_live
---------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

audit_user_negative_time_to_live
---------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

audit_user_keep_hot_count
--------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

audit_user_suggested_size
--------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

audit_user_check_files
-----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_persistent
----------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_shared
------------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

audit_user_max_db_size
-----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

audit_user_auto_propagate
--------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_enable_cache
-----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_positive_time_to_live
--------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

auth_attr_negative_time_to_live
--------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

auth_attr_keep_hot_count
-------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

auth_attr_suggested_size
-------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

auth_attr_check_files
----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_persistent
---------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_shared
-----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

auth_attr_max_db_size
----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

auth_attr_auto_propagate
-------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_enable_cache
------------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_positive_time_to_live
---------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

bootparams_negative_time_to_live
---------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

bootparams_keep_hot_count
--------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

bootparams_suggested_size
--------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

bootparams_check_files
-----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_persistent
----------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_shared
------------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

bootparams_max_db_size
-----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

bootparams_auto_propagate
--------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_enable_cache
--------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_positive_time_to_live
-----------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

ethers_negative_time_to_live
-----------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

ethers_keep_hot_count
----------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

ethers_suggested_size
----------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

ethers_check_files
-------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_persistent
------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_shared
--------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ethers_max_db_size
-------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

ethers_auto_propagate
----------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_enable_cache
-----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_positive_time_to_live
--------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

exec_attr_negative_time_to_live
--------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

exec_attr_keep_hot_count
-------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

exec_attr_suggested_size
-------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

exec_attr_check_files
----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_persistent
---------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_shared
-----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

exec_attr_max_db_size
----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

exec_attr_auto_propagate
-------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_enable_cache
---------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_positive_time_to_live
------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

ipnodes_negative_time_to_live
------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

ipnodes_keep_hot_count
-----------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

ipnodes_suggested_size
-----------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

ipnodes_check_files
--------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_persistent
-------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_shared
---------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

ipnodes_max_db_size
--------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

ipnodes_auto_propagate
-----------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

netmasks_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

netmasks_keep_hot_count
------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

netmasks_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

netmasks_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

netmasks_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

netmasks_auto_propagate
------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

networks_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

networks_keep_hot_count
------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

networks_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

networks_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

networks_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

networks_auto_propagate
------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

printers_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

printers_keep_hot_count
------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

printers_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

printers_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

printers_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

printers_auto_propagate
------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_enable_cache
-----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_positive_time_to_live
--------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

prof_attr_negative_time_to_live
--------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

prof_attr_keep_hot_count
-------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

prof_attr_suggested_size
-------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

prof_attr_check_files
----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_persistent
---------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_shared
-----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

prof_attr_max_db_size
----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

prof_attr_auto_propagate
-------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_enable_cache
---------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_positive_time_to_live
------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

project_negative_time_to_live
------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

project_keep_hot_count
-----------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

project_suggested_size
-----------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

project_check_files
--------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_persistent
-------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_shared
---------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

project_max_db_size
--------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

project_auto_propagate
-----------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_enable_cache
-----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_positive_time_to_live
--------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

protocols_negative_time_to_live
--------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

protocols_keep_hot_count
-------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

protocols_suggested_size
-------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

protocols_check_files
----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_persistent
---------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_shared
-----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

protocols_max_db_size
----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

protocols_auto_propagate
-------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_enable_cache
-----------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_positive_time_to_live
--------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

rpc_negative_time_to_live
--------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

rpc_keep_hot_count
-------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

rpc_suggested_size
-------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

rpc_check_files
----------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_persistent
---------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_shared
-----------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

rpc_max_db_size
----------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

rpc_auto_propagate
-------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_enable_cache
--------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_positive_time_to_live
-----------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

tnrhdb_negative_time_to_live
-----------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

tnrhdb_keep_hot_count
----------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

tnrhdb_suggested_size
----------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

tnrhdb_check_files
-------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_persistent
------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_shared
--------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhdb_max_db_size
-------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

tnrhdb_auto_propagate
----------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_enable_cache
--------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_positive_time_to_live
-----------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

tnrhtp_negative_time_to_live
-----------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

tnrhtp_keep_hot_count
----------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

tnrhtp_suggested_size
----------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

tnrhtp_check_files
-------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_persistent
------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_shared
--------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

tnrhtp_max_db_size
-------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

tnrhtp_auto_propagate
----------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_enable_cache
-----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_positive_time_to_live
--------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 600

user_attr_negative_time_to_live
--------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in seconds.

- *Default*: 20

user_attr_keep_hot_count
-------------------------
Settings for keep-hot-count service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 2048

user_attr_suggested_size
-------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number.

- *Default*: 211

user_attr_check_files
----------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_persistent
---------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_shared
-----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

user_attr_max_db_size
----------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be a number in bytes.

- *Default*: 33554432

user_attr_auto_propagate
-------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd, group, hosts, services, audit_user, auth_attr, bootparams, ethers, exec_attr, ipnodes, netmasks, networks, printers, prof_attr, project, protocols, rpc, tnrhdb, tnrhtp, user_attr. Must be 'yes' or 'no'.

- *Default*: 'yes'

