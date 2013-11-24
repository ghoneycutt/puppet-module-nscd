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

service_ensure
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
