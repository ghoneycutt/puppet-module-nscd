require 'spec_helper'
describe 'nscd', type: :class do
  header = <<-END.gsub(%r{^\s+\|}, '')
    |# This file is being maintained by Puppet.
    |# DO NOT EDIT
    |#
    |# /etc/nscd.conf
    |#
    |# An example Name Service Cache config file.  This file is needed by nscd.
    |#
    |# Legal entries are:
    |#
    |# logfile           <file>
    |# debug-level       <level>
    |# threads           <initial #threads to use>
    |# max-threads       <maximum #threads to use>
    |# server-user       <user to run server as instead of root>
    |#     server-user is ignored if nscd is started with -S parameters
    |# stat-user         <user who is allowed to request statistics>
    |# reload-count      unlimited|<number>
    |# paranoia          <yes|no>
    |# restart-interval  <time in seconds>
    |#
    |# enable-cache          <service> <yes|no>
    |# positive-time-to-live <service> <time in seconds>
    |# negative-time-to-live <service> <time in seconds>
    |# suggested-size        <service> <prime number>
    |# check-files           <service> <yes|no>
    |# persistent            <service> <yes|no>
    |# shared                <service> <yes|no>
    |# max-db-size           <service> <number bytes>
    |# auto-propagate        <service> <yes|no>
    |#
    |# Currently supported cache names (services): passwd, group, hosts, services
    |#
    |# Currently supported cache names for Solaris (services):
    |#               audit_user, auth_attr, bootparams, ethers
    |#               exec_attr, group, hosts, ipnodes, netmasks
    |#               networks, passwd, printers, prof_attr, project
    |#               protocols, rpc, services, tnrhdb, tnrhtp, user_attr
    |#
    |
  END

  base = <<-END.gsub(%r{^\s+\|}, '')
    |logfile           /var/log/nscd.log
    |debug-level       0
    |threads           5
    |max-threads       32
    |
    |stat-user         root
    |reload-count      5
    |paranoia          no
    |restart-interval  3600
  END

  base_server_user = <<-END.gsub(%r{^\s+\|}, '')
    |logfile           /var/log/nscd.log
    |debug-level       0
    |threads           5
    |max-threads       32
    |server-user       nscd
    |stat-user         root
    |reload-count      5
    |paranoia          no
    |restart-interval  3600
  END

  base_solaris = <<-END.gsub(%r{^\s+\|}, '')
    |logfile           /var/adm/nscd.log
    |debug-level       0
  END

  passwd = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# passwd
    |enable-cache            passwd          yes
    |positive-time-to-live   passwd          600
    |negative-time-to-live   passwd          20
    |suggested-size          passwd          211
    |check-files             passwd          yes
    |persistent              passwd          yes
    |shared                  passwd          yes
    |max-db-size             passwd          33554432
    |auto-propagate          passwd          yes
  END

  group = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# group
    |enable-cache            group           yes
    |positive-time-to-live   group           3600
    |negative-time-to-live   group           60
    |suggested-size          group           211
    |check-files             group           yes
    |persistent              group           yes
    |shared                  group           yes
    |max-db-size             group           33554432
    |auto-propagate          group           yes
  END

  hosts = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# hosts
    |enable-cache            hosts           yes
    |positive-time-to-live   hosts           3600
    |negative-time-to-live   hosts           20
    |suggested-size          hosts           211
    |check-files             hosts           yes
    |persistent              hosts           yes
    |shared                  hosts           yes
    |max-db-size             hosts           33554432
  END

  services = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# services
    |enable-cache            services        yes
    |positive-time-to-live   services        28800
    |negative-time-to-live   services        20
    |suggested-size          services        211
    |check-files             services        yes
    |persistent              services        yes
    |shared                  services        yes
    |max-db-size             services        33554432
  END

  netgroup = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# netgroup
    |enable-cache            netgroup        yes
    |positive-time-to-live   netgroup        28800
    |negative-time-to-live   netgroup        20
    |suggested-size          netgroup        211
    |check-files             netgroup        yes
    |persistent              netgroup        yes
    |shared                  netgroup        yes
    |max-db-size             netgroup        33554432
  END

  passwd_solaris = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# passwd
    |enable-cache            passwd          yes
    |positive-time-to-live   passwd          600
    |negative-time-to-live   passwd          20
    |suggested-size          passwd          211
    |keep-hot-count          passwd          2048
    |check-files             passwd          yes
  END

  group_solaris = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# group
    |enable-cache            group           yes
    |positive-time-to-live   group           3600
    |negative-time-to-live   group           60
    |suggested-size          group           211
    |keep-hot-count          group           2048
    |check-files             group           yes
  END

  hosts_solaris = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# hosts
    |enable-cache            hosts           yes
    |positive-time-to-live   hosts           3600
    |negative-time-to-live   hosts           20
    |suggested-size          hosts           211
    |keep-hot-count          hosts           2048
    |check-files             hosts           yes
  END

  services_solaris = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# services
    |enable-cache            services        yes
    |positive-time-to-live   services        28800
    |negative-time-to-live   services        20
    |suggested-size          services        211
    |keep-hot-count          services        2048
    |check-files             services        yes
  END

  audit_user = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# audit_user
    |enable-cache            audit_user      yes
    |positive-time-to-live   audit_user      3600
    |negative-time-to-live   audit_user      20
    |keep-hot-count          audit_user      2048
    |check-files             audit_user      yes
  END

  auth_attr = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# auth_attr
    |enable-cache            auth_attr       yes
    |positive-time-to-live   auth_attr       3600
    |negative-time-to-live   auth_attr       20
    |keep-hot-count          auth_attr       2048
    |check-files             auth_attr       yes
  END

  bootparams = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# bootparams
    |enable-cache            bootparams      yes
    |positive-time-to-live   bootparams      3600
    |negative-time-to-live   bootparams      20
    |keep-hot-count          bootparams      2048
    |check-files             bootparams      yes
  END

  ethers = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# ethers
    |enable-cache            ethers          yes
    |positive-time-to-live   ethers          3600
    |negative-time-to-live   ethers          20
    |keep-hot-count          ethers          2048
    |check-files             ethers          yes
  END

  exec_attr = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# exec_attr
    |enable-cache            exec_attr       yes
    |positive-time-to-live   exec_attr       3600
    |negative-time-to-live   exec_attr       20
    |keep-hot-count          exec_attr       2048
    |check-files             exec_attr       yes
  END

  ipnodes = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# ipnodes
    |enable-cache            ipnodes         yes
    |positive-time-to-live   ipnodes         3600
    |negative-time-to-live   ipnodes         20
    |keep-hot-count          ipnodes         2048
    |check-files             ipnodes         yes
  END

  netmasks = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# netmasks
    |enable-cache            netmasks        yes
    |positive-time-to-live   netmasks        3600
    |negative-time-to-live   netmasks        20
    |keep-hot-count          netmasks        2048
    |check-files             netmasks        yes
  END

  networks = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# networks
    |enable-cache            networks        yes
    |positive-time-to-live   networks        3600
    |negative-time-to-live   networks        20
    |keep-hot-count          networks        2048
    |check-files             networks        yes
  END

  printers = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# printers
    |enable-cache            printers        yes
    |positive-time-to-live   printers        3600
    |negative-time-to-live   printers        20
    |keep-hot-count          printers        2048
    |check-files             printers        yes
  END

  prof_attr = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# prof_attr
    |enable-cache            prof_attr       yes
    |positive-time-to-live   prof_attr       3600
    |negative-time-to-live   prof_attr       20
    |keep-hot-count          prof_attr       2048
    |check-files             prof_attr       yes
  END

  project = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# project
    |enable-cache            project         yes
    |positive-time-to-live   project         3600
    |negative-time-to-live   project         20
    |keep-hot-count          project         2048
    |check-files             project         yes
  END

  protocols = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# protocols
    |enable-cache            protocols       yes
    |positive-time-to-live   protocols       3600
    |negative-time-to-live   protocols       20
    |keep-hot-count          protocols       2048
    |check-files             protocols       yes
  END

  rpc = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# rpc
    |enable-cache            rpc             yes
    |positive-time-to-live   rpc             3600
    |negative-time-to-live   rpc             20
    |keep-hot-count          rpc             2048
    |check-files             rpc             yes
  END

  tnrhdb = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# tnrhdb
    |enable-cache            tnrhdb          yes
    |positive-time-to-live   tnrhdb          3600
    |negative-time-to-live   tnrhdb          20
    |keep-hot-count          tnrhdb          2048
    |check-files             tnrhdb          yes
  END

  tnrhtp = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# tnrhtp
    |enable-cache            tnrhtp          yes
    |positive-time-to-live   tnrhtp          3600
    |negative-time-to-live   tnrhtp          20
    |keep-hot-count          tnrhtp          2048
    |check-files             tnrhtp          yes
  END

  user_attr = <<-END.gsub(%r{^\s+\|}, '')
    |
    |# user_attr
    |enable-cache            user_attr       yes
    |positive-time-to-live   user_attr       3600
    |negative-time-to-live   user_attr       20
    |keep-hot-count          user_attr       2048
    |check-files             user_attr       yes
  END

  on_supported_os.sort.each do |os, facts|
    # define os specific defaults
    case "#{facts[:os]['family']}-#{facts[:os]['release']['major']}"
    when 'RedHat-5'
      nscd_conf = header + base_server_user + passwd + group + hosts
    when 'RedHat-6'
      nscd_conf = header + base_server_user + passwd + group + hosts + services
    when 'RedHat-7'
      nscd_conf = header + base_server_user + passwd + group + hosts + services + netgroup
    when 'RedHat-8'
      nscd_conf = header + base_server_user + hosts
    when 'RedHat-9'
      nscd_conf = header + base_server_user + passwd + group + hosts + services + netgroup
    when 'RedHat-2015', 'RedHat-2016', 'RedHat-2017'
      nscd_conf = header + base_server_user + passwd + group + hosts + services + netgroup
    when 'Solaris-10'
      solaris1 = audit_user + auth_attr + bootparams + ethers + exec_attr + ipnodes + netmasks
      solaris2 = networks + printers + prof_attr + project + protocols + rpc + tnrhdb + tnrhtp + user_attr
      nscd_conf = header + base_solaris + passwd_solaris + group_solaris + hosts_solaris + services_solaris + solaris1 + solaris2
      package = 'SUNWcsu'
      package_source = '/var/spool/pkg'
      service_name = 'name-service-cache'
    when 'Suse-10'
      nscd_conf = header + base_server_user + passwd + group + hosts
    when 'Suse-11'
      nscd_conf = header + base + passwd + group + hosts + services
    when 'Suse-12', 'Suse-13', 'Suse-15'
      nscd_conf = header + base_server_user + passwd + group + hosts + services + netgroup
      provider = 'systemd'
    when 'Debian-6', 'Debian-12.04', 'Debian-14.04', 'Debian-16.04', 'Debian-18.04', 'Debian-20.04', 'Debian-22.04'
      nscd_conf = header + base + passwd + group + hosts + services
    end

    describe "on #{os} with default values for parameters" do
      let(:facts) { facts }

      package      = 'nscd' if package.nil?
      service_name = 'nscd' if service_name.nil?

      it { is_expected.to contain_class('nscd') }

      it do
        is_expected.to contain_package(package).only_with(
          {
            'ensure'    => 'present',
            'source'    => package_source,
            'adminfile' => nil,
            'before'    => 'File[nscd_config]',
          },
        )
      end

      it do
        is_expected.to contain_file('nscd_config').only_with(
          {
            'ensure'    => 'file',
            'path'      => '/etc/nscd.conf',
            'content'   => nscd_conf,
            'owner'     => 'root',
            'group'     => 'root',
            'mode'      => '0644',
          },
        )
      end

      it do
        is_expected.to contain_service('nscd_service').only_with(
          {
            'ensure'    => 'running',
            'name'      => service_name,
            'enable'    => true,
            'provider'  => provider,
            'subscribe' => 'File[nscd_config]',
          },
        )
      end
    end
  end

  describe 'parameters on supported OS' do
    # The following tests are OS independent, so we only test one supported OS
    redhat = {
      supported_os: [
        {
          'operatingsystem'        => 'RedHat',
          'operatingsystemrelease' => ['8'],
        },
      ],
    }

    on_supported_os(redhat).each do |_os, facts|
      let(:facts) { facts }

      context 'with audit_user_check_files set to valid value when enable_db_audit_user is set to true' do
        let(:params) { { audit_user_check_files: 'no', enable_db_audit_user: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             audit_user      no}) }
      end

      context 'with audit_user_enable_cache set to valid value when enable_db_audit_user is set to true' do
        let(:params) { { audit_user_enable_cache: 'no', enable_db_audit_user: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            audit_user      no}) }
      end

      context 'with audit_user_keep_hot_count set to valid value when enable_db_audit_user is set to true' do
        let(:params) { { audit_user_keep_hot_count: 242, enable_db_audit_user: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          audit_user      242}) }
      end

      context 'with audit_user_negative_time_to_live set to valid value when enable_db_audit_user is set to true' do
        let(:params) { { audit_user_negative_time_to_live: 242, enable_db_audit_user: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   audit_user      242}) }
      end

      context 'with audit_user_positive_time_to_live set to valid value when enable_db_audit_user is set to true' do
        let(:params) { { audit_user_positive_time_to_live: 242, enable_db_audit_user: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   audit_user      242}) }
      end

      context 'with auth_attr_check_files set to valid value when enable_db_auth_attr is set to true' do
        let(:params) { { auth_attr_check_files: 'no', enable_db_auth_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             auth_attr       no}) }
      end

      context 'with auth_attr_enable_cache set to valid value when enable_db_auth_attr is set to true' do
        let(:params) { { auth_attr_enable_cache: 'no', enable_db_auth_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            auth_attr       no}) }
      end

      context 'with auth_attr_keep_hot_count set to valid value when enable_db_auth_attr is set to true' do
        let(:params) { { auth_attr_keep_hot_count: 242, enable_db_auth_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          auth_attr       242}) }
      end

      context 'with auth_attr_negative_time_to_live set to valid value when enable_db_auth_attr is set to true' do
        let(:params) { { auth_attr_negative_time_to_live: 242, enable_db_auth_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   auth_attr       242}) }
      end

      context 'with auth_attr_positive_time_to_live set to valid value when enable_db_auth_attr is set to true' do
        let(:params) { { auth_attr_positive_time_to_live: 242, enable_db_auth_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   auth_attr       242}) }
      end

      context 'with bootparams_check_files set to valid value when enable_db_bootparams is set to true' do
        let(:params) { { bootparams_check_files: 'no', enable_db_bootparams: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             bootparams      no}) }
      end

      context 'with bootparams_enable_cache set to valid value when enable_db_bootparams is set to true' do
        let(:params) { { bootparams_enable_cache: 'no', enable_db_bootparams: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            bootparams      no}) }
      end

      context 'with bootparams_keep_hot_count set to valid value when enable_db_bootparams is set to true' do
        let(:params) { { bootparams_keep_hot_count: 242, enable_db_bootparams: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          bootparams      242}) }
      end

      context 'with bootparams_negative_time_to_live set to valid value when enable_db_bootparams is set to true' do
        let(:params) { { bootparams_negative_time_to_live: 242, enable_db_bootparams: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   bootparams      242}) }
      end

      context 'with bootparams_positive_time_to_live set to valid value when enable_db_bootparams is set to true' do
        let(:params) { { bootparams_positive_time_to_live: 242, enable_db_bootparams: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   bootparams      242}) }
      end

      context 'with config_group set to valid value' do
        let(:params) { { config_group: 'test' } }

        it { is_expected.to contain_file('nscd_config').with_group('test') }
      end

      context 'with config_mode set to valid value' do
        let(:params) { { config_mode: '0242' } }

        it { is_expected.to contain_file('nscd_config').with_mode('0242') }
      end

      context 'with config_path set to valid value' do
        let(:params) { { config_path: '/test/ing' } }

        it { is_expected.to contain_file('nscd_config').with_path('/test/ing') }
      end

      context 'with config_owner set to valid value' do
        let(:params) { { config_owner: 'test' } }

        it { is_expected.to contain_file('nscd_config').with_owner('test') }
      end

      context 'with debug_level set to valid value' do
        let(:params) { { debug_level: 242 } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{debug-level       242}) }
      end

      context 'with enable_db_audit_user set to valid value true' do
        let(:params) { { enable_db_audit_user: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{audit_user}}) }
      end

      context 'with enable_db_auth_attr set to valid value true' do
        let(:params) { { enable_db_auth_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{auth_attr}}) }
      end

      context 'with enable_db_bootparams set to valid value true' do
        let(:params) { { enable_db_bootparams: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{bootparams}}) }
      end

      context 'with enable_db_ethers set to valid value true' do
        let(:params) { { enable_db_ethers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{ethers}}) }
      end

      context 'with enable_db_exec_attr set to valid value true' do
        let(:params) { { enable_db_exec_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{exec_attr}}) }
      end

      context 'with enable_db_group set to valid value true' do
        let(:params) { { enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{group}}) }
      end

      context 'with enable_db_hosts set to valid value true' do
        let(:params) { { enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{hosts}}) }
      end

      context 'with enable_db_ipnodes set to valid value true' do
        let(:params) { { enable_db_ipnodes: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{ipnodes}}) }
      end

      context 'with enable_db_netgroup set to valid value true' do
        let(:params) { { enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{netgroup}}) }
      end

      context 'with enable_db_netmasks set to valid value true' do
        let(:params) { { enable_db_netmasks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{netmasks}}) }
      end

      context 'with enable_db_networks set to valid value true' do
        let(:params) { { enable_db_networks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{networks}}) }
      end

      context 'with enable_db_passwd set to valid value true' do
        let(:params) { { enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{passwd}}) }
      end

      context 'with enable_db_printers set to valid value true' do
        let(:params) { { enable_db_printers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{printers}}) }
      end

      context 'with enable_db_prof_attr set to valid value true' do
        let(:params) { { enable_db_prof_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{prof_attr}}) }
      end

      context 'with enable_db_project set to valid value true' do
        let(:params) { { enable_db_project: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{project}}) }
      end

      context 'with enable_db_protocols set to valid value true' do
        let(:params) { { enable_db_protocols: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{protocols}}) }
      end

      context 'with enable_db_rpc set to valid value true' do
        let(:params) { { enable_db_rpc: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{rpc}}) }
      end

      context 'with enable_db_services set to valid value true' do
        let(:params) { { enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{services}}) }
      end

      context 'with enable_db_tnrhdb set to valid value true' do
        let(:params) { { enable_db_tnrhdb: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{tnrhdb}}) }
      end

      context 'with enable_db_tnrhtp set to valid value true' do
        let(:params) { { enable_db_tnrhtp: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{tnrhtp}}) }
      end

      context 'with enable_db_user_attr set to valid value true' do
        let(:params) { { enable_db_user_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{#{user_attr}}) }
      end

      context 'with enable_opt_auto_propagate set to valid value true when enable_db_passwd and enable_db_group are true' do
        let(:params) { { enable_opt_auto_propagate: true, enable_db_passwd: true, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{auto-propagate          (passwd|group)}) }
      end

      context 'with enable_opt_auto_propagate set to valid value false when enable_db_passwd and enable_db_group are true' do
        let(:params) { { enable_opt_auto_propagate: false, enable_db_passwd: true, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').without_content(%r{auto-propagate          (passwd|group)}) }
      end

      context 'with ethers_check_files set to valid value when enable_db_ethers is set to true' do
        let(:params) { { ethers_check_files: 'no', enable_db_ethers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             ethers          no}) }
      end

      context 'with ethers_enable_cache set to valid value when enable_db_ethers is set to true' do
        let(:params) { { ethers_enable_cache: 'no', enable_db_ethers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            ethers          no}) }
      end

      context 'with ethers_keep_hot_count set to valid value when enable_db_ethers is set to true' do
        let(:params) { { ethers_keep_hot_count: 242, enable_db_ethers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          ethers          242}) }
      end

      context 'with ethers_negative_time_to_live set to valid value when enable_db_ethers is set to true' do
        let(:params) { { ethers_negative_time_to_live: 242, enable_db_ethers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   ethers          242}) }
      end

      context 'with ethers_positive_time_to_live set to valid value when enable_db_ethers is set to true' do
        let(:params) { { ethers_positive_time_to_live: 242, enable_db_ethers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   ethers          242}) }
      end

      context 'with exec_attr_check_files set to valid value when enable_db_exec_attr is set to true' do
        let(:params) { { exec_attr_check_files: 'no', enable_db_exec_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             exec_attr       no}) }
      end

      context 'with exec_attr_enable_cache set to valid value when enable_db_exec_attr is set to true' do
        let(:params) { { exec_attr_enable_cache: 'no', enable_db_exec_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            exec_attr       no}) }
      end

      context 'with exec_attr_keep_hot_count set to valid value when enable_db_exec_attr is set to true' do
        let(:params) { { exec_attr_keep_hot_count: 242, enable_db_exec_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          exec_attr       242}) }
      end

      context 'with exec_attr_negative_time_to_live set to valid value when enable_db_exec_attr is set to true' do
        let(:params) { { exec_attr_negative_time_to_live: 242, enable_db_exec_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   exec_attr       242}) }
      end

      context 'with exec_attr_positive_time_to_live set to valid value when enable_db_exec_attr is set to true' do
        let(:params) { { exec_attr_positive_time_to_live: 242, enable_db_exec_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   exec_attr       242}) }
      end

      context 'with group_auto_propagate set to valid value when enable_db_auth_attr is set to true' do
        let(:params) { { group_auto_propagate: 'no', enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{auto-propagate          group           no}) }
      end

      context 'with group_check_files set to valid value when enable_db_group is set to true' do
        let(:params) { { group_check_files: 'no', enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             group           no}) }
      end

      context 'with group_enable_cache set to valid value when enable_db_group is set to true' do
        let(:params) { { group_enable_cache: 'no', enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            group           no}) }
      end

      context 'with group_max_db_size set to valid value when enable_db_group is set to true' do
        let(:params) { { group_max_db_size: 242, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{max-db-size             group           242}) }
      end

      context 'with group_negative_time_to_live set to valid value when enable_db_group is set to true' do
        let(:params) { { group_negative_time_to_live: 242, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   group           242}) }
      end

      context 'with group_persistent set to valid value when enable_db_group is set to true' do
        let(:params) { { group_persistent: 'no', enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{persistent              group           no}) }
      end

      context 'with group_positive_time_to_live set to valid value when enable_db_group is set to true' do
        let(:params) { { group_positive_time_to_live: 242, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   group           242}) }
      end

      context 'with group_shared set to valid value when enable_db_group is set to true' do
        let(:params) { { group_shared: 'no', enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{shared                  group           no}) }
      end

      context 'with group_suggested_size set to valid value when enable_db_group is set to true' do
        let(:params) { { group_suggested_size: 242, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{suggested-size          group           242}) }
      end

      context 'with hosts_check_files set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_check_files: 'no', enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             hosts           no}) }
      end

      context 'with hosts_enable_cache set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_enable_cache: 'no', enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            hosts           no}) }
      end

      context 'with hosts_max_db_size set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_max_db_size: 242, enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{max-db-size             hosts           242}) }
      end

      context 'with hosts_negative_time_to_live set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_negative_time_to_live: 242, enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   hosts           242}) }
      end

      context 'with hosts_persistent set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_persistent: 'no', enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{persistent              hosts           no}) }
      end

      context 'with hosts_positive_time_to_live set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_positive_time_to_live: 242, enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   hosts           242}) }
      end

      context 'with hosts_shared set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_shared: 'no', enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{shared                  hosts           no}) }
      end

      context 'with hosts_suggested_size set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_suggested_size: 242, enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{suggested-size          hosts           242}) }
      end

      context 'with ipnodes_check_files set to valid value when enable_db_ipnodes is set to true' do
        let(:params) { { ipnodes_check_files: 'no', enable_db_ipnodes: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             ipnodes         no}) }
      end

      context 'with ipnodes_enable_cache set to valid value when enable_db_ipnodes is set to true' do
        let(:params) { { ipnodes_enable_cache: 'no', enable_db_ipnodes: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            ipnodes         no}) }
      end

      context 'with ipnodes_keep_hot_count set to valid value when enable_db_ipnodes is set to true' do
        let(:params) { { ipnodes_keep_hot_count: 242, enable_db_ipnodes: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          ipnodes         242}) }
      end

      context 'with ipnodes_negative_time_to_live set to valid value when enable_db_ipnodes is set to true' do
        let(:params) { { ipnodes_negative_time_to_live: 242, enable_db_ipnodes: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   ipnodes         242}) }
      end

      context 'with ipnodes_positive_time_to_live set to valid value when enable_db_ipnodes is set to true' do
        let(:params) { { ipnodes_positive_time_to_live: 242, enable_db_ipnodes: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   ipnodes         242}) }
      end

      context 'with logfile set to valid value' do
        let(:params) { { logfile: '/test/ing' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{logfile           /test/ing}) }
      end

      context 'with max_threads set to valid value' do
        let(:params) { { max_threads: 242 } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{max-threads       242}) }
      end

      context 'with netgroup_check_files set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_check_files: 'no', enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             netgroup        no}) }
      end

      context 'with netgroup_enable_cache set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_enable_cache: 'no', enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            netgroup        no}) }
      end

      context 'with netgroup_max_db_size set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_max_db_size: 242, enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{max-db-size             netgroup        242}) }
      end

      context 'with netgroup_negative_time_to_live set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_negative_time_to_live: 242, enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   netgroup        242}) }
      end

      context 'with netgroup_persistent set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_persistent: 'no', enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{persistent              netgroup        no}) }
      end

      context 'with netgroup_positive_time_to_live set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_positive_time_to_live: 242, enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   netgroup        242}) }
      end

      context 'with netgroup_shared set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_shared: 'no', enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{shared                  netgroup        no}) }
      end

      context 'with netgroup_suggested_size set to valid value when enable_db_netgroup is set to true' do
        let(:params) { { netgroup_suggested_size: 242, enable_db_netgroup: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{suggested-size          netgroup        242}) }
      end

      context 'with netmasks_check_files set to valid value when enable_db_netmasks is set to true' do
        let(:params) { { netmasks_check_files: 'no', enable_db_netmasks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             netmasks        no}) }
      end

      context 'with netmasks_enable_cache set to valid value when enable_db_netmasks is set to true' do
        let(:params) { { netmasks_enable_cache: 'no', enable_db_netmasks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            netmasks        no}) }
      end

      context 'with netmasks_keep_hot_count set to valid value when enable_db_netmasks is set to true' do
        let(:params) { { netmasks_keep_hot_count: 242, enable_db_netmasks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          netmasks        242}) }
      end

      context 'with netmasks_negative_time_to_live set to valid value when enable_db_netmasks is set to true' do
        let(:params) { { netmasks_negative_time_to_live: 242, enable_db_netmasks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   netmasks        242}) }
      end

      context 'with netmasks_positive_time_to_live set to valid value when enable_db_netmasks is set to true' do
        let(:params) { { netmasks_positive_time_to_live: 242, enable_db_netmasks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   netmasks        242}) }
      end

      context 'with networks_check_files set to valid value when enable_db_networks is set to true' do
        let(:params) { { networks_check_files: 'no', enable_db_networks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             networks        no}) }
      end

      context 'with networks_enable_cache set to valid value when enable_db_networks is set to true' do
        let(:params) { { networks_enable_cache: 'no', enable_db_networks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            networks        no}) }
      end

      context 'with networks_keep_hot_count set to valid value when enable_db_networks is set to true' do
        let(:params) { { networks_keep_hot_count: 242, enable_db_networks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          networks        242}) }
      end

      context 'with networks_negative_time_to_live set to valid value when enable_db_networks is set to true' do
        let(:params) { { networks_negative_time_to_live: 242, enable_db_networks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   networks        242}) }
      end

      context 'with networks_positive_time_to_live set to valid value when enable_db_networks is set to true' do
        let(:params) { { networks_positive_time_to_live: 242, enable_db_networks: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   networks        242}) }
      end

      context 'with package_adminfile set to valid value' do
        let(:params) { { package_adminfile: '/test/ing' } }

        it { is_expected.to contain_package('nscd').with_adminfile('/test/ing') }
      end

      context 'with package_ensure set to valid value' do
        let(:params) { { package_ensure: 'installed' } }

        it { is_expected.to contain_package('nscd').with_ensure('installed') }
      end

      context 'with package_name set to valid value' do
        let(:params) { { package_name: ['test', 'ing'] } }

        it { is_expected.to contain_package('test') }
        it { is_expected.to contain_package('ing') }
      end

      context 'with package_source set to valid value' do
        let(:params) { { package_source: '/test/ing' } }

        it { is_expected.to contain_package('nscd').with_source('/test/ing') }
      end

      context 'with paranoia set to valid value' do
        let(:params) { { paranoia: 'yes' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{paranoia          yes}) }
      end

      context 'with passwd_check_files set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_check_files: 'no', enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             passwd          no}) }
      end

      context 'with passwd_enable_cache set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_enable_cache: 'no', enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            passwd          no}) }
      end

      context 'with passwd_max_db_size set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_max_db_size: 242, enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{max-db-size             passwd          242}) }
      end

      context 'with passwd_negative_time_to_live set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_negative_time_to_live: 242, enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   passwd          242}) }
      end

      context 'with passwd_persistent set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_persistent: 'no', enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{persistent              passwd          no}) }
      end

      context 'with passwd_positive_time_to_live set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_positive_time_to_live: 242, enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   passwd          242}) }
      end

      context 'with passwd_shared set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_shared: 'no', enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{shared                  passwd          no}) }
      end

      context 'with passwd_suggested_size set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_suggested_size: 242, enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{suggested-size          passwd          242}) }
      end

      context 'with printers_check_files set to valid value when enable_db_printers is set to true' do
        let(:params) { { printers_check_files: 'no', enable_db_printers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             printers        no}) }
      end

      context 'with printers_enable_cache set to valid value when enable_db_printers is set to true' do
        let(:params) { { printers_enable_cache: 'no', enable_db_printers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            printers        no}) }
      end

      context 'with printers_keep_hot_count set to valid value when enable_db_printers is set to true' do
        let(:params) { { printers_keep_hot_count: 242, enable_db_printers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          printers        242}) }
      end

      context 'with printers_negative_time_to_live set to valid value when enable_db_printers is set to true' do
        let(:params) { { printers_negative_time_to_live: 242, enable_db_printers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   printers        242}) }
      end

      context 'with printers_positive_time_to_live set to valid value when enable_db_printers is set to true' do
        let(:params) { { printers_positive_time_to_live: 242, enable_db_printers: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   printers        242}) }
      end

      context 'with prof_attr_check_files set to valid value when enable_db_prof_attr is set to true' do
        let(:params) { { prof_attr_check_files: 'no', enable_db_prof_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             prof_attr       no}) }
      end

      context 'with prof_attr_enable_cache set to valid value when enable_db_prof_attr is set to true' do
        let(:params) { { prof_attr_enable_cache: 'no', enable_db_prof_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            prof_attr       no}) }
      end

      context 'with prof_attr_keep_hot_count set to valid value when enable_db_prof_attr is set to true' do
        let(:params) { { prof_attr_keep_hot_count: 242, enable_db_prof_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          prof_attr       242}) }
      end

      context 'with prof_attr_negative_time_to_live set to valid value when enable_db_prof_attr is set to true' do
        let(:params) { { prof_attr_negative_time_to_live: 242, enable_db_prof_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   prof_attr       242}) }
      end

      context 'with prof_attr_positive_time_to_live set to valid value when enable_db_prof_attr is set to true' do
        let(:params) { { prof_attr_positive_time_to_live: 242, enable_db_prof_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   prof_attr       242}) }
      end

      context 'with project_check_files set to valid value when enable_db_project is set to true' do
        let(:params) { { project_check_files: 'no', enable_db_project: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             project         no}) }
      end

      context 'with project_enable_cache set to valid value when enable_db_project is set to true' do
        let(:params) { { project_enable_cache: 'no', enable_db_project: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            project         no}) }
      end

      context 'with project_keep_hot_count set to valid value when enable_db_project is set to true' do
        let(:params) { { project_keep_hot_count: 242, enable_db_project: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          project         242}) }
      end

      context 'with project_negative_time_to_live set to valid value when enable_db_project is set to true' do
        let(:params) { { project_negative_time_to_live: 242, enable_db_project: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   project         242}) }
      end

      context 'with project_positive_time_to_live set to valid value when enable_db_project is set to true' do
        let(:params) { { project_positive_time_to_live: 242, enable_db_project: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   project         242}) }
      end

      context 'with protocols_check_files set to valid value when enable_db_protocols is set to true' do
        let(:params) { { protocols_check_files: 'no', enable_db_protocols: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             protocols       no}) }
      end

      context 'with protocols_enable_cache set to valid value when enable_db_protocols is set to true' do
        let(:params) { { protocols_enable_cache: 'no', enable_db_protocols: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            protocols       no}) }
      end

      context 'with protocols_keep_hot_count set to valid value when enable_db_protocols is set to true' do
        let(:params) { { protocols_keep_hot_count: 242, enable_db_protocols: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          protocols       242}) }
      end

      context 'with protocols_negative_time_to_live set to valid value when enable_db_protocols is set to true' do
        let(:params) { { protocols_negative_time_to_live: 242, enable_db_protocols: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   protocols       242}) }
      end

      context 'with protocols_positive_time_to_live set to valid value when enable_db_protocols is set to true' do
        let(:params) { { protocols_positive_time_to_live: 242, enable_db_protocols: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   protocols       242}) }
      end

      context 'with reload_count set to valid value' do
        let(:params) { { reload_count: 242 } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{reload-count      242}) }
      end

      context 'with restart_interval set to valid value' do
        let(:params) { { restart_interval: 242 } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{restart-interval  242}) }
      end

      context 'with rpc_check_files set to valid value when enable_db_rpc is set to true' do
        let(:params) { { rpc_check_files: 'no', enable_db_rpc: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             rpc             no}) }
      end

      context 'with rpc_enable_cache set to valid value when enable_db_rpc is set to true' do
        let(:params) { { rpc_enable_cache: 'no', enable_db_rpc: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            rpc             no}) }
      end

      context 'with rpc_keep_hot_count set to valid value when enable_db_rpc is set to true' do
        let(:params) { { rpc_keep_hot_count: 242, enable_db_rpc: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          rpc             242}) }
      end

      context 'with rpc_negative_time_to_live set to valid value when enable_db_rpc is set to true' do
        let(:params) { { rpc_negative_time_to_live: 242, enable_db_rpc: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   rpc             242}) }
      end

      context 'with rpc_positive_time_to_live set to valid value when enable_db_rpc is set to true' do
        let(:params) { { rpc_positive_time_to_live: 242, enable_db_rpc: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   rpc             242}) }
      end

      context 'with server_user set to valid value' do
        let(:params) { { server_user: 'test' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{server-user       test}) }
      end

      context 'with service_enable set to valid value' do
        let(:params) { { service_enable: false } }

        it { is_expected.to contain_service('nscd_service').with_enable(false) }
      end

      context 'with service_ensure set to valid value' do
        let(:params) { { service_ensure: 'stopped' } }

        it { is_expected.to contain_service('nscd_service').with_ensure('stopped') }
      end

      context 'with service_name set to valid value' do
        let(:params) { { service_name: 'test' } }

        it { is_expected.to contain_service('nscd_service').with_name('test') }
      end

      context 'with service_provider set to valid value' do
        let(:params) { { service_provider: 'test' } }

        it { is_expected.to contain_service('nscd_service').with_provider('test') }
      end

      context 'with services_check_files set to valid value when enable_db_services is set to true' do
        let(:params) { { services_check_files: 'no', enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             services        no}) }
      end

      context 'with services_enable_cache set to valid value when enable_db_services is set to true' do
        let(:params) { { services_enable_cache: 'no', enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            services        no}) }
      end

      context 'with services_max_db_size set to valid value when enable_db_services is set to true' do
        let(:params) { { services_max_db_size: 242, enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{max-db-size             services        242}) }
      end

      context 'with services_negative_time_to_live set to valid value when enable_db_services is set to true' do
        let(:params) { { services_negative_time_to_live: 242, enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   services        242}) }
      end

      context 'with services_persistent set to valid value when enable_db_services is set to true' do
        let(:params) { { services_persistent: 'no', enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{persistent              services        no}) }
      end

      context 'with services_positive_time_to_live set to valid value when enable_db_services is set to true' do
        let(:params) { { services_positive_time_to_live: 242, enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   services        242}) }
      end

      context 'with services_shared set to valid value when enable_db_services is set to true' do
        let(:params) { { services_shared: 'no', enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{shared                  services        no}) }
      end

      context 'with services_suggested_size set to valid value when enable_db_services is set to true' do
        let(:params) { { services_suggested_size: 242, enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{suggested-size          services        242}) }
      end

      context 'with stat_user set to valid value' do
        let(:params) { { stat_user: 'test' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{stat-user         test}) }
      end

      context 'with threads set to valid value' do
        let(:params) { { threads: 242 } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{threads           242}) }
      end

      context 'with tnrhdb_check_files set to valid value when enable_db_tnrhdb is set to true' do
        let(:params) { { tnrhdb_check_files: 'no', enable_db_tnrhdb: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             tnrhdb          no}) }
      end

      context 'with tnrhdb_enable_cache set to valid value when enable_db_tnrhdb is set to true' do
        let(:params) { { tnrhdb_enable_cache: 'no', enable_db_tnrhdb: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            tnrhdb          no}) }
      end

      context 'with tnrhdb_keep_hot_count set to valid value when enable_db_tnrhdb is set to true' do
        let(:params) { { tnrhdb_keep_hot_count: 242, enable_db_tnrhdb: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          tnrhdb          242}) }
      end

      context 'with tnrhdb_negative_time_to_live set to valid value when enable_db_tnrhdb is set to true' do
        let(:params) { { tnrhdb_negative_time_to_live: 242, enable_db_tnrhdb: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   tnrhdb          242}) }
      end

      context 'with tnrhdb_positive_time_to_live set to valid value when enable_db_tnrhdb is set to true' do
        let(:params) { { tnrhdb_positive_time_to_live: 242, enable_db_tnrhdb: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   tnrhdb          242}) }
      end

      context 'with tnrhtp_check_files set to valid value when enable_db_tnrhtp is set to true' do
        let(:params) { { tnrhtp_check_files: 'no', enable_db_tnrhtp: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             tnrhtp          no}) }
      end

      context 'with tnrhtp_enable_cache set to valid value when enable_db_tnrhtp is set to true' do
        let(:params) { { tnrhtp_enable_cache: 'no', enable_db_tnrhtp: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            tnrhtp          no}) }
      end

      context 'with tnrhtp_keep_hot_count set to valid value when enable_db_tnrhtp is set to true' do
        let(:params) { { tnrhtp_keep_hot_count: 242, enable_db_tnrhtp: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          tnrhtp          242}) }
      end

      context 'with tnrhtp_negative_time_to_live set to valid value when enable_db_tnrhtp is set to true' do
        let(:params) { { tnrhtp_negative_time_to_live: 242, enable_db_tnrhtp: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   tnrhtp          242}) }
      end

      context 'with tnrhtp_positive_time_to_live set to valid value when enable_db_tnrhtp is set to true' do
        let(:params) { { tnrhtp_positive_time_to_live: 242, enable_db_tnrhtp: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   tnrhtp          242}) }
      end

      context 'with user_attr_check_files set to valid value when enable_db_user_attr is set to true' do
        let(:params) { { user_attr_check_files: 'no', enable_db_user_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{check-files             user_attr       no}) }
      end

      context 'with user_attr_enable_cache set to valid value when enable_db_user_attr is set to true' do
        let(:params) { { user_attr_enable_cache: 'no', enable_db_user_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{enable-cache            user_attr       no}) }
      end

      context 'with user_attr_keep_hot_count set to valid value when enable_db_user_attr is set to true' do
        let(:params) { { user_attr_keep_hot_count: 242, enable_db_user_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          user_attr       242}) }
      end

      context 'with user_attr_negative_time_to_live set to valid value when enable_db_user_attr is set to true' do
        let(:params) { { user_attr_negative_time_to_live: 242, enable_db_user_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{negative-time-to-live   user_attr       242}) }
      end

      context 'with user_attr_positive_time_to_live set to valid value when enable_db_user_attr is set to true' do
        let(:params) { { user_attr_positive_time_to_live: 242, enable_db_user_attr: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{positive-time-to-live   user_attr       242}) }
      end
    end
  end

  describe 'parameters on supported OS Solaris' do
    # The following tests are Solaris dependent
    solaris = {
      supported_os: [
        {
          'operatingsystem'        => '"Solaris"',
          'operatingsystemrelease' => ['10'],
        },
      ],
    }

    on_supported_os(solaris).each do |_os, facts|
      let(:facts) { facts }

      context 'with group_keep_hot_count set to valid value when enable_db_group is set to true' do
        let(:params) { { group_keep_hot_count: 242, enable_db_group: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          group           242}) }
      end

      context 'with hosts_keep_hot_count set to valid value when enable_db_hosts is set to true' do
        let(:params) { { hosts_keep_hot_count: 242, enable_db_hosts: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          hosts           242}) }
      end

      context 'with passwd_keep_hot_count set to valid value when enable_db_passwd is set to true' do
        let(:params) { { passwd_keep_hot_count: 242, enable_db_passwd: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          passwd          242}) }
      end

      context 'with services_keep_hot_count set to valid value when enable_db_services is set to true' do
        let(:params) { { services_keep_hot_count: 242, enable_db_services: true } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{keep-hot-count          services        242}) }
      end
    end
  end
end
