require 'spec_helper'
describe 'nscd' do
  defaults = {
    kernel:                    'Linux',
    osfamily:                  nil,
    package_adminfile:         nil,
    package_name:              ['nscd'],
    package_source:            nil,
    server_user:               nil,
    service_name:              'nscd',
    service_provider:          nil,
    enable_db_services:        true,
    enable_db_netgroup:        false,
    enable_opt_auto_propagate: true,
    enable_db_passwd:          true,
    enable_db_group:           true,
    enable_db_hosts:           true,
    enable_db_audit_user:      false,
    enable_db_auth_attr:       false,
    enable_db_bootparams:      false,
    enable_db_ethers:          false,
    enable_db_exec_attr:       false,
    enable_db_ipnodes:         false,
    enable_db_netmasks:        false,
    enable_db_networks:        false,
    enable_db_printers:        false,
    enable_db_prof_attr:       false,
    enable_db_project:         false,
    enable_db_protocols:       false,
    enable_db_rpc:             false,
    enable_db_tnrhdb:          false,
    enable_db_tnrhtp:          false,
    enable_db_user_attr:       false,
  }

  platforms = {
    'debian6' => defaults.merge(
      {
        osfamily:                  'Debian',
        operatingsystemmajrelease: '6',
        server_user:               nil,
        service_provider:          nil,
        enable_db_services:        true,
        enable_db_netgroup:        false,
        enable_opt_auto_propagate: true,
      },
    ),
    'el5' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '5',
        server_user:               'nscd',
        enable_db_services:        false,
        enable_db_netgroup:        false,
      },
    ),
    'el6' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '6',
        server_user:               'nscd',
      },
    ),
    'amazon2015' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '2015',
        server_user:               'nscd',
        enable_db_netgroup:        true,
      },
    ),
    'amazon2016' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '2016',
        server_user:               'nscd',
        enable_db_netgroup:        true,
      },
    ),
    'amazon2017' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '2017',
        server_user:               'nscd',
        enable_db_netgroup:        true,
      },
    ),
    'el7' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '7',
        server_user:               'nscd',
        enable_db_netgroup:        true,
      },
    ),
    'el8' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '8',
        server_user:               'nscd',
        enable_db_services:        false,
        enable_db_netgroup:        false,
        enable_db_passwd:          false,
        enable_db_group:           false,
        enable_db_hosts:           true,
      },
    ),
    'el9' => defaults.merge(
      {
        osfamily:                  'RedHat',
        operatingsystemmajrelease: '9',
        server_user:               'nscd',
        enable_db_services:        true,
        enable_db_netgroup:        true,
        enable_db_passwd:          true,
        enable_db_group:           true,
        enable_db_hosts:           true,
      },
    ),
    'suse10' => defaults.merge(
      {
        osfamily:                  'Suse',
        operatingsystemmajrelease: '10',
        operatingsystemrelease:    '10.1',
        enable_db_services:        false,
        enable_opt_auto_propagate: false,
      },
    ),
    'suse11' => defaults.merge(
      {
        osfamily:                  'Suse',
        operatingsystemmajrelease: '11',
        operatingsystemrelease:    '11.2',
      },
    ),
    'suse12' => defaults.merge(
      {
        osfamily:                  'Suse',
        operatingsystemmajrelease: '12',
        operatingsystemrelease:    '12.3',
        server_user:               'nscd',
        service_provider:          'systemd',
        enable_db_netgroup:        true,
      },
    ),
    'suse13' => defaults.merge(
      {
        osfamily:                  'Suse',
        operatingsystemmajrelease: '13',
        operatingsystemrelease:    '13.0',
        server_user:               'nscd',
        service_provider:          'systemd',
        enable_db_netgroup:        true,
      },
    ),
    'suse15' => defaults.merge(
      {
        osfamily:                  'Suse',
        operatingsystemmajrelease: '15',
        operatingsystemrelease:    '15.0',
        server_user:               'nscd',
        service_provider:          'systemd',
        enable_db_netgroup:        true,
      },
    ),
    'ubuntu12' => defaults.merge(
      {
        osfamily:                  'Debian',
        operatingsystemmajrelease: '12',
        server_user:               nil,
        service_provider:          nil,
        enable_db_services:        true,
        enable_db_netgroup:        false,
        enable_opt_auto_propagate: true,
      },
    ),
    'solaris10' => defaults.merge(
      {
        kernel:                    'SunOS',
        osfamily:                  'Solaris',
        kernelrelease:             '5.10',
        package_name:              ['SUNWcsu'],
        package_source:            '/var/spool/pkg',
        service_name:              'name-service-cache',
        enable_db_group:           true,
        enable_db_netgroup:        false,
        enable_db_audit_user:      true,
        enable_db_auth_attr:       true,
        enable_db_bootparams:      true,
        enable_db_ethers:          true,
        enable_db_exec_attr:       true,
        enable_db_ipnodes:         true,
        enable_db_netmasks:        true,
        enable_db_networks:        true,
        enable_db_printers:        true,
        enable_db_prof_attr:       true,
        enable_db_project:         true,
        enable_db_protocols:       true,
        enable_db_rpc:             true,
        enable_db_tnrhdb:          true,
        enable_db_tnrhtp:          true,
        enable_db_user_attr:       true,
        enable_opt_auto_propagate: false
      },
    ),
  }

  services_solaris = [
    'audit_user',
    'auth_attr',
    'bootparams',
    'ethers',
    'exec_attr',
    'ipnodes',
    'netmasks',
    'networks',
    'printers',
    'prof_attr',
    'project',
    'protocols',
    'rpc',
    'tnrhdb',
    'tnrhtp',
    'user_attr',
  ]

  platforms.sort.each do |_k, v|
    describe "on #{v[:osfamily]} #{v[:operatingsystemmajrelease]}#{v[:operatingsystemrelease]}#{v[:kernelrelease]} with default values for all parameters" do
      let(:facts) do
        {
          operatingsystemmajrelease: v[:operatingsystemmajrelease],
          operatingsystemrelease:    v[:operatingsystemrelease],
          kernelrelease:             v[:kernelrelease],
          kernel:                    v[:kernel],
          osfamily:                  v[:osfamily],
          os: {
            family:                  v[:osfamily],
            release: {
              major:                 v[:operatingsystemmajrelease],
            },
          },
        }
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to contain_class('nscd') }

      v[:package_name].each do |package|
        it do
          is_expected.to contain_package(package).with(
            {
              'ensure'    => 'present',
              'source'    => v[:package_source],
              'adminfile' => v[:package_adminfile],
              'before'    => 'File[nscd_config]',
            },
          )
        end
      end

      it do
        is_expected.to contain_file('nscd_config').with(
          {
            'ensure'  => 'file',
            'path'    => '/etc/nscd.conf',
            'owner'   => 'root',
            'group'   => 'root',
            'mode'    => '0644',
          },
        )
      end

      it { is_expected.to contain_file('nscd_config').with_content(%r{^debug-level\ +0$}) }

      if v[:osfamily] != 'Solaris'
        it { is_expected.to contain_file('nscd_config').with_content(%r{^logfile\ +/var/log/nscd\.log$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^threads\ +5$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^max-threads\ +32$}) }
        if !v[:server_user].nil?
          it { is_expected.to contain_file('nscd_config').with_content(%r{^\s*server-user\ +#{v[:server_user]}$}) }
        else
          it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*server-user}) }
        end
        it { is_expected.to contain_file('nscd_config').with_content(%r{^stat-user\ +root$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^reload-count\ +5$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^paranoia\ +no$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^restart-interval\ +3600$}) }
      else
        it { is_expected.to contain_file('nscd_config').with_content(%r{^logfile\ +/var/adm/nscd\.log$}) }
      end

      if v[:enable_db_passwd] == true
        it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +passwd\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +passwd\ +600$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +passwd\ +20$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^suggested-size\ +passwd\ +211$}) }

        if v[:osfamily] == 'Solaris'
          it { is_expected.to contain_file('nscd_config').with_content(%r{^keep-hot-count\ +passwd\ +2048$}) }
        end
        it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +passwd\ +yes$}) }

        if v[:osfamily] != 'Solaris'
          it { is_expected.to contain_file('nscd_config').with_content(%r{^persistent\ +passwd\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^shared\ +passwd\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^max-db-size\ +passwd\ +33554432$}) }

          if v[:enable_opt_auto_propagate] == true
            it { is_expected.to contain_file('nscd_config').with_content(%r{^auto-propagate\ +passwd\ +yes$}) }
          else
            it { is_expected.to contain_file('nscd_config').without_content(%r{^auto-propagate +passwd}) }
          end

        end
      else
        it { is_expected.to contain_file('nscd_config').without_content(%r{^enable-cache\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^positive-time-to-live\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^negative-time-to-live\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^suggested-size\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^keep-hot-count\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^check-files\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^persistent\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^shared\ +passwd}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^max-db-size\ +passwd}) }
      end
      if v[:enable_db_group] == true
        it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +group\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +group\ +3600$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +group\ +60$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^suggested-size\ +group\ +211$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +group\ +yes$}) }
        if v[:osfamily] != 'Solaris'
          it { is_expected.to contain_file('nscd_config').with_content(%r{^persistent\ +group\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^shared\ +group\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^max-db-size\ +group\ +33554432$}) }
          if v[:enable_opt_auto_propagate] == true
            it { is_expected.to contain_file('nscd_config').with_content(%r{^auto-propagate\ +group\ +yes$}) }
          else
            it { is_expected.to contain_file('nscd_config').without_content(%r{^auto-propagate +group}) }
          end
        else
          it { is_expected.to contain_file('nscd_config').with_content(%r{^keep-hot-count\ +group\ +2048$}) }
        end
      else
        it { is_expected.to contain_file('nscd_config').without_content(%r{^enable-cache\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^positive-time-to-live\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^negative-time-to-live\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^suggested-size\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^keep-hot-count\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^check-files\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^persistent\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^shared\ +group}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^max-db-size\ +group}) }
      end
      if v[:enable_db_hosts] == true
        it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +hosts\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +hosts\ +3600$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +hosts\ +20$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^suggested-size\ +hosts\ +211$}) }
        if v[:osfamily] == 'Solaris'
          it { is_expected.to contain_file('nscd_config').with_content(%r{^keep-hot-count\ +hosts\ +2048$}) }
        end
        it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +hosts\ +yes$}) }
        if v[:osfamily] != 'Solaris'
          it { is_expected.to contain_file('nscd_config').with_content(%r{^persistent\ +hosts\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^shared\ +hosts\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^max-db-size\ +hosts\ +33554432$}) }
        end
      else
        it { is_expected.to contain_file('nscd_config').without_content(%r{^enable-cache\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^positive-time-to-live\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^negative-time-to-live\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^suggested-size\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^keep-hot-count\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^check-files\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^persistent\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^shared\ +hosts}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^max-db-size\ +hosts}) }
      end
      if v[:enable_db_services] == true
        it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +services\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +services\ +28800$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +services\ +20$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^suggested-size\ +services\ +211$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +services\ +yes$}) }
        if v[:osfamily] == 'Solaris'
          it { is_expected.to contain_file('nscd_config').with_content(%r{^keep-hot-count\ +services\ +2048$}) }
        else
          it { is_expected.to contain_file('nscd_config').with_content(%r{^persistent\ +services\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^shared\ +services\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^max-db-size\ +services\ +33554432$}) }
        end
      else
        it { is_expected.to contain_file('nscd_config').without_content(%r{^enable-cache\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^positive-time-to-live\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^negative-time-to-live\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^suggested-size\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^keep-hot-count\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^check-files\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^persistent\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^shared\ +services}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^max-db-size\ +services}) }
      end

      services_solaris.each do |service|
        enable_service = "enable_db_#{service}"
        if v[enable_service.to_sym] == true
          it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +#{service}\ +yes$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +#{service}\ +3600$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +#{service}\ +20$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^keep-hot-count\ +#{service}\ +2048$}) }
          it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +#{service}\ +yes$}) }
        else
          it { is_expected.to contain_file('nscd_config').without_content(%r{^enable-cache\ +#{service}}) }
          it { is_expected.to contain_file('nscd_config').without_content(%r{^positive-time-to-live\ +#{service}}) }
          it { is_expected.to contain_file('nscd_config').without_content(%r{^negative-time-to-live\ +#{service}}) }
          it { is_expected.to contain_file('nscd_config').without_content(%r{^keep-hot-count\ +#{service}}) }
          it { is_expected.to contain_file('nscd_config').without_content(%r{^check-files\ +#{service}}) }
        end
      end
      if v[:enable_db_netgroup] == true
        it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +netgroup\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +netgroup\ +28800$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +netgroup\ +20$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^suggested-size\ +netgroup\ +211$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +netgroup\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^persistent\ +netgroup\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^shared\ +netgroup\ +yes$}) }
        it { is_expected.to contain_file('nscd_config').with_content(%r{^max-db-size\ +netgroup\ +33554432$}) }
      else
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*enable-cache\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*positive-time-to-live\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*negative-time-to-live\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*suggested-size\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*check-files\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*persistent\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*shared\ +netgroup}) }
        it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*max-db-size\ +netgroup}) }
      end

      if !v[:service_provider].nil?
        it do
          is_expected.to contain_service('nscd_service').with(
            {
              'ensure'    => 'running',
              'name'      => v[:service_name],
              'enable'    => 'true',
              'provider'  => v[:service_provider],
              'subscribe' => 'File[nscd_config]',
            },
          )
        end
      else
        it do
          is_expected.to contain_service('nscd_service').with(
            {
              'ensure'    => 'running',
              'name'      => v[:service_name],
              'enable'    => 'true',
              'provider'  => nil,
              'subscribe' => 'File[nscd_config]',
            },
          )
        end
      end
    end
  end

  describe 'with package_adminfile parameter specified' do
    context 'as an absolute path' do
      let(:params) { { package_adminfile: '/my/adminfile' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_package('nscd').with({ 'adminfile' => '/my/adminfile' }) }
    end

    context 'as an invalid type' do
      let(:params) { { package_adminfile: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with package_source parameter specified' do
    context 'as an absolute path' do
      let(:params) { { package_source: '/my/source' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_package('nscd').with({ 'source' => '/my/source' }) }
    end

    context 'as an invalid type' do
      let(:params) { { package_source: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with package_name parameter specified' do
    context 'as an array' do
      let(:params) { { package_name: ['nscd', 'foo'] } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_package('nscd').with({ 'ensure' => 'present' }) }
      it { is_expected.to contain_package('foo').with({ 'ensure' => 'present' }) }
    end

    context 'as an invalid type' do
      let(:params) { { package_name: 'string' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with package_ensure parameter' do
    context 'set to all possible valid values' do
      ['present', 'installed', 'absent'].each do |ensure_value|
        context "package_ensure => #{ensure_value}" do
          let(:params) { { package_ensure: ensure_value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_package('nscd').with({ 'ensure' => ensure_value.to_s }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { package_ensure: 'invalid' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum})
      end
    end
  end

  describe 'with config_path parameter specified' do
    context 'as a valid path' do
      let(:params) { { config_path: '/usr/local/etc/nscd.conf' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with({ 'path' => '/usr/local/etc/nscd.conf' }) }
    end

    context 'as an invalid value' do
      let(:params) { { config_path: 'invalid/path' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{Stdlib::Absolutepath})
      end
    end
  end

  describe 'with config_owner parameter specified' do
    context 'as a valid string' do
      let(:params) { { config_owner: 'root' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with({ 'owner' => 'root' }) }
    end

    context 'as an invalid type' do
      let(:params) { { config_owner: ['invalid', 'root'] } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a String})
      end
    end
  end

  describe 'with config_group parameter specified' do
    context 'as a valid string' do
      let(:params) { { config_group: 'root' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with({ 'group' => 'root' }) }
    end

    context 'as an invalid type' do
      let(:params) { { config_group: ['invalid', 'root'] } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a String})
      end
    end
  end

  describe 'with config_mode parameter specified' do
    context 'with valid value' do
      let(:params) { { config_mode: '0644' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with({ 'mode' => '0644' }) }
    end

    context 'with invalid value' do
      let(:params) { { config_mode: '0844' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end

    context 'with invalid type' do
      let(:params) { { config_mode: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with service_name parameter specified' do
    context 'as a valid string' do
      let(:params) { { service_name: 'mynscd' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_service('nscd_service').with({ 'name' => 'mynscd' }) }
    end

    context 'as an invalid type' do
      let(:params) { { service_name: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with service_ensure parameter' do
    context 'set to all possible valid values' do
      ['running', 'stopped'].each do |ensure_value|
        context "service_ensure => #{ensure_value}" do
          let(:params) { { service_ensure: ensure_value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_service('nscd_service').with({ 'ensure' => ensure_value.to_s }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { service_ensure: 'invalid' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with service_enable parameter' do
    context 'set to all possible valid values' do
      [true, false].each do |enable_value|
        context "service_enable => #{enable_value}" do
          let(:params) { { service_enable: enable_value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_service('nscd_service').with({ 'enable' => enable_value }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { service_enable: 'invalid' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end

    context 'set to invalid type' do
      let(:params) { { service_enable: ['invalid', 'type'] } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with service_provider parameter specified' do
    context 'as a valid string' do
      let(:params) { { service_provider: 'myprovider' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_service('nscd_service').with({ 'provider' => 'myprovider' }) }
    end

    context 'as an invalid type' do
      let(:params) { { service_provider: ['not', 'a', 'string'] } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  ['passwd', 'group', 'hosts', 'services', 'netgroup'].each do |service|
    describe "with enable_db_#{service}" do
      [true, false].each do |value|
        context "set to valid value #{value}" do
          let(:params) { { "enable_db_#{service}": value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_class('nscd') }
        end
      end

      context 'set to an invalid type (non-boolean or string convertible to boolean)' do
        let(:params) { { "enable_db_#{service}": ['invalid', 'type'] } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
        end
      end
    end
  end

  describe 'with enable_opt_auto_propagate' do
    [true, false].each do |value|
      context "set to valid value #{value}" do
        let(:params) { { enable_opt_auto_propagate: value } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it { is_expected.to contain_class('nscd') }
      end
    end

    context 'set to an invalid type (non-boolean or string convertible to boolean)' do
      let(:params) { { enable_opt_auto_propagate: ['invalid', 'type'] } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with logfile parameter specified' do
    context 'with a valid path' do
      let(:params) { { logfile: '/path/to/nscd.log' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^logfile\ +/path/to/nscd\.log$}) }
    end

    context 'as an invalid path' do
      let(:params) { { logfile: 'invalid/path' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end

    context 'as an invalid type' do
      let(:params) { { logfile: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with threads parameter specified' do
    context 'as a valid number' do
      let(:params) { { threads: 23 } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^threads\ +23$}) }
    end

    context 'as an invalid value' do
      let(:params) { { threads: 'x' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end

    context 'as an invalid type' do
      let(:params) { { threads: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end
  end

  describe 'with max_threads parameter specified' do
    context 'as a valid number' do
      let(:params) { { max_threads: 42 } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^max-threads\ +42$}) }
    end

    context 'as an invalid value' do
      let(:params) { { max_threads: 'x' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end

    context 'as an invalid type' do
      let(:params) { { max_threads: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end
  end

  describe 'with server_user parameter' do
    context 'specified as a valid string' do
      let(:params) { { server_user: 'root' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^server-user\ +root$}) }
    end

    context 'not specified' do
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').without_content(%r{^\s*server-user}) }
    end
  end

  describe 'with stat_user parameter' do
    context 'specified as a valid string' do
      let(:params) { { stat_user: 'lmcdtre' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^stat-user\ +lmcdtre$}) }
    end

    context 'as an invalid type' do
      let(:params) { { stat_user: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a String})
      end
    end
  end

  describe 'with debug_level parameter specified' do
    context 'as a valid integer' do
      let(:params) { { debug_level: 5 } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^debug-level\ +5$}) }
    end

    context 'as an invalid value' do
      let(:params) { { debug_level: 'x' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end

    context 'as an invalid type' do
      let(:params) { { debug_level: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end
  end

  describe 'with reload_count parameter specified' do
    context 'as a valid integer' do
      let(:params) { { reload_count: 5 } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^reload-count\ +5$}) }
    end

    context 'as \'unlimited\'' do
      let(:params) { { reload_count: 'unlimited' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^reload-count\ +unlimited$}) }
    end

    ['unlimitedd', 'invalid', '-1'].each do |value|
      context "as invalid value #{value}" do
        let(:params) { { reload_count: value } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{Integer or Enum})
        end
      end
    end

    context 'as an invalid type' do
      let(:params) { { reload_count: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{Integer or Enum})
      end
    end
  end

  describe 'with paranoia parameter specified' do
    ['yes', 'no'].each do |value|
      context "as valid value #{value}" do
        let(:params) { { paranoia: value } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^paranoia\ +#{value}$}) }
      end
    end

    ['yess', 'nooo', '-1', true].each do |value|
      context "as invalid value #{value}" do
        let(:params) { { paranoia: value } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
        end
      end
    end
  end

  describe 'with restart_interval parameter specified' do
    context 'as a valid number' do
      let(:params) { { restart_interval: 31_415 } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it { is_expected.to contain_file('nscd_config').with_content(%r{^restart-interval\ +31415$}) }
    end

    context 'as an invalid value' do
      let(:params) { { restart_interval: 'x' } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end

    context 'as an invalid type' do
      let(:params) { { restart_interval: true } }
      let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

      it 'fail' do
        expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
      end
    end
  end

  ['passwd', 'group', 'hosts', 'services', 'netgroup'].each do |service|
    describe "with #{service}_enable_cache specified" do
      ['yes', 'no'].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              "enable_db_#{service}":    true,
              "#{service}_enable_cache": value,
            }
          end
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +#{service}\ +#{value}$}) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { "#{service}_enable_cache": value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it 'fail' do
            expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
          end
        end
      end
    end

    describe "with #{service}_positive_time_to_live specified" do
      context 'as a valid number' do
        let :params do
          {
            "enable_db_#{service}":             true,
            "#{service}_positive_time_to_live": 31_415,
          }
        end
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +#{service}\ +31415$}) }
      end

      context 'as an invalid value' do
        let(:params) { { "#{service}_positive_time_to_live": 'x' } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end

      context 'as an invalid type' do
        let(:params) { { "#{service}_positive_time_to_live": true } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end
    end

    describe "with #{service}_negative_time_to_live specified" do
      context 'as a valid number' do
        let :params do
          {
            "enable_db_#{service}":             true,
            "#{service}_negative_time_to_live": 23,
          }
        end
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +#{service}\ +23$}) }
      end

      context 'as an invalid value' do
        let(:params) { { "#{service}_negative_time_to_live": 'x' } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end

      context 'as an invalid type' do
        let(:params) { { "#{service}_negative_time_to_live": true } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end
    end

    describe "with #{service}_suggested_size specified" do
      context 'as a valid number' do
        let :params do
          {
            "enable_db_#{service}":      true,
            "#{service}_suggested_size": 411,
          }
        end
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^suggested-size\ +#{service}\ +411$}) }
      end

      context 'as an invalid value' do
        let(:params) { { "#{service}_suggested_size": 'x' } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end

      context 'as an invalid type' do
        let(:params) { { "#{service}_suggested_size": true } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end
    end

    describe "with #{service}_check_files specified" do
      ['yes', 'no'].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              "enable_db_#{service}":   true,
              "#{service}_check_files": value,
            }
          end
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +#{service}\ +#{value}$}) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { "#{service}_check_files": value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it 'fail' do
            expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
          end
        end
      end
    end

    describe "with #{service}_persistent specified" do
      ['yes', 'no'].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              "enable_db_#{service}":  true,
              "#{service}_persistent": value,
            }
          end
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_file('nscd_config').with_content(%r{^persistent\ +#{service}\ +#{value}$}) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { "#{service}_persistent": value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it 'fail' do
            expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
          end
        end
      end
    end

    describe "with #{service}_shared specified" do
      ['yes', 'no'].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              "enable_db_#{service}": true,
              "#{service}_shared":    value,
            }
          end
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it { is_expected.to contain_file('nscd_config').with_content(%r{^shared\ +#{service}\ +#{value}$}) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { "#{service}_shared": value } }
          let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

          it 'fail' do
            expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
          end
        end
      end
    end

    describe "with #{service}_max_db_size specified" do
      context 'as a valid number' do
        let :params do
          {
            "enable_db_#{service}":   true,
            "#{service}_max_db_size": 1_000_000,
          }
        end
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^max-db-size\ +#{service}\ +1000000$}) }
      end

      context 'as an invalid value' do
        let(:params) { { "#{service}_max_db_size": 'x' } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end

      context 'as an invalid type' do
        let(:params) { { "#{service}_max_db_size": true } }
        let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end
    end

    # only the passwd and group services use auto-propogate
    describe "with #{service}_auto_propagate specified" do
      if ['passwd', 'group'].include?(service)
        ['yes', 'no'].each do |value|
          context "as valid value #{value}" do
            let :params do
              {
                "enable_db_#{service}":      true,
                "#{service}_auto_propagate": value,
              }
            end
            let(:facts) { { osfamily: 'Debian', os: { family: 'Debian' }, kernel: 'Linux' } }

            it { is_expected.to contain_file('nscd_config').with_content(%r{^auto-propagate\ +#{service}\ +#{value}$}) }
          end
        end

        ['yess', 'nooo', '-1', true].each do |value|
          context "as invalid value #{value}" do
            let(:params) { { "#{service}_auto_propagate": value } }
            let(:facts) { { osfamily: 'Debian', kernel: 'Linux' } }

            it 'fail' do
              expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
            end
          end
        end
      end
    end
  end

  services_solaris.each do |service|
    describe "with #{service}_enable_cache specified" do
      ['yes', 'no'].each do |value|
        context "as valid value #{value}" do
          let(:params) { { "#{service}_enable_cache": value } }
          let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

          it { is_expected.to contain_file('nscd_config').with_content(%r{^enable-cache\ +#{service}\ +#{value}$}) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { "#{service}_enable_cache": value } }
          let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

          it 'fail' do
            expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
          end
        end
      end
    end

    describe "with #{service}_positive_time_to_live specified" do
      context 'as a valid number' do
        let(:params) { { "#{service}_positive_time_to_live": 31_415 } }
        let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^positive-time-to-live\ +#{service}\ +31415$}) }
      end

      context 'as an invalid value' do
        let(:params) { { "#{service}_positive_time_to_live": 'x' } }
        let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end

      context 'as an invalid type' do
        let(:params) { { "#{service}_positive_time_to_live": true } }
        let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end
    end

    describe "with #{service}_negative_time_to_live specified" do
      context 'as a valid number' do
        let(:params) { { "#{service}_negative_time_to_live": 23 } }
        let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

        it { is_expected.to contain_file('nscd_config').with_content(%r{^negative-time-to-live\ +#{service}\ +23$}) }
      end

      context 'as an invalid value' do
        let(:params) { { "#{service}_negative_time_to_live": 'x' } }
        let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end

      context 'as an invalid type' do
        let(:params) { { "#{service}_negative_time_to_live": true } }
        let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

        it 'fail' do
          expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects an Integer})
        end
      end
    end

    describe "with #{service}_check_files specified" do
      ['yes', 'no'].each do |value|
        context "as valid value #{value}" do
          let(:params) { { "#{service}_check_files": value } }
          let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

          it { is_expected.to contain_file('nscd_config').with_content(%r{^check-files\ +#{service}\ +#{value}$}) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { "#{service}_check_files": value } }
          let(:facts)  { { osfamily: 'Solaris', os: { family: 'Solaris' }, kernelrelease: '5.10', kernel: 'SunOS' } }

          it 'fail' do
            expect { is_expected.to contain_class('nscd') }.to raise_error(Puppet::Error, %r{expects a match for Enum\['no', 'yes'\]})
          end
        end
      end
    end
  end
end
