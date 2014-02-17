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

- *Default*: '/var/log/nscd.log'

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

passwd_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'no'

passwd_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: '600'

passwd_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: 20

passwd_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number.

- *Default*: 211

passwd_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

passwd_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in bytes.

- *Default*: 33554432

passwd_auto_propagate
------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd or group. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'no'

group_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: '600'

group_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: 20

group_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number.

- *Default*: 211

group_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

group_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in bytes.

- *Default*: 33554432

group_auto_propagate
------------------------
Settings for auto-propagate service in nscd.conf where service can be either passwd or group. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'no'

hosts_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: '600'

hosts_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: 20

hosts_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number.

- *Default*: 211

hosts_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

hosts_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in bytes.

- *Default*: 33554432

services_enable_cache
----------------------
Settings for enable-cache service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'no'

services_positive_time_to_live
-------------------------------
Settings for positive-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: '600'

services_negative_time_to_live
-------------------------------
Settings for negative-time-to-live service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: 20

services_suggested_size
------------------------
Settings for suggested-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number.

- *Default*: 211

services_check_files
---------------------
Settings for check-files service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_persistent
--------------------
Settings for persistent service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_shared
----------------
Settings for shared service in nscd.conf where service can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

services_max_db_size
---------------------
Settings for max-db-size service in nscd.conf where service can be either passwd, group, hosts, services. Must be a number in bytes.

- *Default*: 33554432
