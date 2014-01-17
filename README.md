# puppet-module-nscd
===

[![Build Status](https://travis-ci.org/ghoneycutt/puppet-module-nscd.png?branch=master)](https://travis-ci.org/ghoneycutt/puppet-module-nscd)

Brief description here.

===

# Compatibility
---------------
This module is built for use with Puppet v3 on the following OS families.

* EL 6

===

# Parameters
------------

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
Mode of nscd.conf. Must be a string in four digit octal notation.

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

logfile
-------
Setting for logfile in nscd.conf. See nscd.conf(5). Must be an absolute path.

- *Default*: '/var/log/nscd.log'

threads
-------
Setting for threads in nscd.conf. See nscd.conf(5). Must be an number expressed as an integer or a string.

- *Default*: 4

max_threads
-----------
Setting for max-threads in nscd.conf. See nscd.conf(5). Must be an number expressed as an integer or a string.

- *Default*: 32

enable_server_user
------------------
Set to false if the 'server\_user' should be commented out in the nscd.conf file.  This is required for SLES11SP3.

- *Default*: true

server_user
-----------
Setting for server-user in nscd.conf. See nscd.conf(5).

- *Default*: 'nscd'

stat_user
---------
Setting for stat-user in nscd.conf.  See nscd.conf(5).

- *Default*: 'root'

debug_level
-----------
Setting for debug-level in nscd.conf.  See nscd.conf(5). Must be a number.

- *Default*: 0

reload_count
------------
Settings for reload-count in nscd.conf.  See nscd.conf(5). Must be a number or 'unlimited'.

- *Default*: 5

paranoia
--------
Setting for paranoia in nscd.conf.  See nscd.conf(5). Must be 'yes' or 'no'.

- *Default*: 'no'

restart_interval
----------------
Setting for restart-interval in nscd.conf.  See nscd.conf(5). Must be a number.

- *Default*: 3600

\<service\>\_enable\_cache
----------------------
Settings for enable-cache \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'no' for passwd and group, 'yes' for hosts and servives.

\<service\>\_positive\_time\_to\_live
-------------------------------
Settings for positive-time-to-live \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: 600

\<service\>\_negative\_time\_to\_live
-------------------------------
Settings for negative-time-to-live \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be a number in seconds.

- *Default*: 20

\<service\>\_suggested\_size
------------------------
Settings for suggested-size \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be a number.

- *Default*: 211

\<service\>\_check\_files
---------------------
Settings for check-files \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

\<service\>\_persistent
--------------------
Settings for persistent \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

\<service\>\_shared
----------------
Settings for shared \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be 'yes' or 'no'.

- *Default*: 'yes'

\<service\>\_max\_db\_size
---------------------
Settings for max-db-size \<service\> in nscd.conf where \<service\> can be either passwd, group, hosts, services. Must be a number in bytes.

- *Default*: 33554432

\<service\>\_auto\_propagate
------------------------
Settings for auto-propagate \<service\> in nscd.conf where \<service\> can be either passwd or group. Must be 'yes' or 'no'.

- *Default*: 'yes'
