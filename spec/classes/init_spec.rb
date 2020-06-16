require 'spec_helper'
describe 'nscd' do
  defaults = {
        :osfamily                  => nil,
        :package_adminfile         => nil,
        :package_name              => 'nscd',
        :package_source            => nil,
        :server_user               => nil,
        :service_name              => 'nscd',
        :service_provider          => nil,
        :enable_db_services        => true,
        :enable_db_netgroup        => false,
        :enable_opt_auto_propagate => true,
        :enable_db_passwd          => true,
        :enable_db_group           => true,
        :enable_db_hosts           => true,
        :enable_db_audit_user      => false,
        :enable_db_auth_attr       => false,
        :enable_db_bootparams      => false,
        :enable_db_ethers          => false,
        :enable_db_exec_attr       => false,
        :enable_db_ipnodes         => false,
        :enable_db_netmasks        => false,
        :enable_db_networks        => false,
        :enable_db_printers        => false,
        :enable_db_prof_attr       => false,
        :enable_db_project         => false,
        :enable_db_protocols       => false,
        :enable_db_rpc             => false,
        :enable_db_tnrhdb          => false,
        :enable_db_tnrhtp          => false,
        :enable_db_user_attr       => false,
  }

  platforms = {
    'debian6' => defaults.merge({
        :osfamily                  => 'Debian',
        :operatingsystemmajrelease => '6',
        :server_user               => nil,
        :service_provider          => nil,
        :enable_db_services        => true,
        :enable_db_netgroup        => false,
        :enable_opt_auto_propagate => true,
      }),
    'el5' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '5',
        :server_user               => 'nscd',
        :enable_db_services        => false,
        :enable_db_netgroup        => false,
      }),
    'el6' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '6',
        :server_user               => 'nscd',
      }),
    'amazon2015' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '2015',
        :server_user               => 'nscd',
        :enable_db_netgroup        => true,
      }),
    'amazon2016' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '2016',
        :server_user               => 'nscd',
        :enable_db_netgroup        => true,
      }),
    'amazon2017' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '2017',
        :server_user               => 'nscd',
        :enable_db_netgroup        => true,
      }),
    'el7' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '7',
        :server_user               => 'nscd',
        :enable_db_netgroup        => true,
      }),
    'el8' => defaults.merge({
        :osfamily                  => 'RedHat',
        :operatingsystemmajrelease => '8',
        :server_user               => 'nscd',
        :enable_db_services        => false,
        :enable_db_netgroup        => false,
        :enable_db_passwd          => false,
        :enable_db_group           => false,
        :enable_db_hosts           => true,
      }),
    'suse10' => defaults.merge({
         :osfamily                  => 'Suse',
         :operatingsystemrelease    => '10.1',
         :enable_db_services        => false,
         :enable_opt_auto_propagate => false,
      }),
    'suse11' => defaults.merge({
        :osfamily                  => 'Suse',
        :operatingsystemrelease    => '11.2',
      }),
    'suse12' => defaults.merge({
        :osfamily                  => 'Suse',
        :operatingsystemrelease    => '12.3',
        :server_user               => 'nscd',
        :service_provider          => 'systemd',
        :enable_db_netgroup        => true,
      }),
    'suse13' => defaults.merge({
        :osfamily                  => 'Suse',
        :operatingsystemrelease    => '13.0',
        :server_user               => 'nscd',
        :service_provider          => 'systemd',
        :enable_db_netgroup        => true,
      }),
      'suse15' => defaults.merge({
        :osfamily                  => 'Suse',
        :operatingsystemrelease    => '15.0',
        :server_user               => 'nscd',
        :service_provider          => 'systemd',
        :enable_db_netgroup        => true,
      }),
    'ubuntu12' => defaults.merge({
        :osfamily                  => 'Debian',
        :operatingsystemmajrelease => '12',
        :server_user               => nil,
        :service_provider          => nil,
        :enable_db_services        => true,
        :enable_db_netgroup        => false,
        :enable_opt_auto_propagate => true,

      }),
    'solaris10' => defaults.merge({
        :osfamily                  => 'Solaris',
        :kernelrelease             => '5.10',
        :package_name              => 'SUNWcsu',
        :package_source            => '/var/spool/pkg',
        :service_name              => 'name-service-cache',
        :enable_db_group           => true,
        :enable_db_netgroup        => false,
        :enable_db_audit_user      => true,
        :enable_db_auth_attr       => true,
        :enable_db_bootparams      => true,
        :enable_db_ethers          => true,
        :enable_db_exec_attr       => true,
        :enable_db_ipnodes         => true,
        :enable_db_netmasks        => true,
        :enable_db_networks        => true,
        :enable_db_printers        => true,
        :enable_db_prof_attr       => true,
        :enable_db_project         => true,
        :enable_db_protocols       => true,
        :enable_db_rpc             => true,
        :enable_db_tnrhdb          => true,
        :enable_db_tnrhtp          => true,
        :enable_db_user_attr       => true,
        :enable_opt_auto_propagate => false
      }),
  }

  services_solaris = %w[
    audit_user
    auth_attr
    bootparams
    ethers
    exec_attr
    ipnodes
    netmasks
    networks
    printers
    prof_attr
    project
    protocols
    rpc
    tnrhdb
    tnrhtp
    user_attr
  ]

  platforms.sort.each do |_k, v|
    describe "on #{v[:osfamily]} #{v[:operatingsystemmajrelease]}#{v[:operatingsystemrelease]}#{v[:kernelrelease]} with default values for all parameters" do
      let(:facts) do
        {
          :operatingsystemmajrelease => v[:operatingsystemmajrelease],
          :operatingsystemrelease    => v[:operatingsystemrelease],
          :kernelrelease             => v[:kernelrelease],
          :osfamily                  => v[:osfamily],
        }
      end

      it { should compile.with_all_deps }

      it { should contain_class('nscd') }

      it do
        should contain_package(v[:package_name]).with({
          'ensure'    => 'present',
          'source'    => v[:package_source],
          'adminfile' => v[:package_adminfile],
        })
      end

      it do
        should contain_file('nscd_config').with({
          'ensure'  => 'file',
          'path'    => '/etc/nscd.conf',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
          'require' => "Package[#{v[:package_name]}]",
        })
      end

      it { should contain_file('nscd_config').with_content(/^debug-level\ +0$/) }
      if v[:osfamily] != 'Solaris'
        it { should contain_file('nscd_config').with_content(%r{^logfile\ +/var/log/nscd\.log$}) }
        it { should contain_file('nscd_config').with_content(/^threads\ +5$/) }
        it { should contain_file('nscd_config').with_content(/^max-threads\ +32$/) }
        if v[:server_user] != nil
          it { should contain_file('nscd_config').with_content(/^\s*server-user\ +#{v[:server_user]}$/) }
        else
          it { should contain_file('nscd_config').without_content(/^\s*server-user/) }
        end
        it { should contain_file('nscd_config').with_content(/^stat-user\ +root$/) }
        it { should contain_file('nscd_config').with_content(/^reload-count\ +5$/) }
        it { should contain_file('nscd_config').with_content(/^paranoia\ +no$/) }
        it { should contain_file('nscd_config').with_content(/^restart-interval\ +3600$/) }
      else
        it { should contain_file('nscd_config').with_content(%r{^logfile\ +/var/adm/nscd\.log$}) }
      end
      if v[:enable_db_passwd] == true
        it { should contain_file('nscd_config').with_content(/^enable-cache\ +passwd\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +passwd\ +600$/) }
        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +passwd\ +20$/) }
        it { should contain_file('nscd_config').with_content(/^suggested-size\ +passwd\ +211$/) }
        if v[:osfamily] == 'Solaris'
          it { should contain_file('nscd_config').with_content(/^keep-hot-count\ +passwd\ +2048$/) }
        else
          it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +passwd/) }
        end
        it { should contain_file('nscd_config').with_content(/^check-files\ +passwd\ +yes$/) }
        if v[:osfamily] != 'Solaris'
          it { should contain_file('nscd_config').with_content(/^persistent\ +passwd\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^shared\ +passwd\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^max-db-size\ +passwd\ +33554432$/) }
          if v[:enable_opt_auto_propagate] == true
            it { should contain_file('nscd_config').with_content(/^auto-propagate\ +passwd\ +yes$/) }
          else
            it { should contain_file('nscd_config').without_content(/^auto-propagate +passwd/) }
          end
        end
      else
        it { should contain_file('nscd_config').without_content(/^enable-cache\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^positive-time-to-live\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^negative-time-to-live\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^suggested-size\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^check-files\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^persistent\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^shared\ +passwd/) }
        it { should contain_file('nscd_config').without_content(/^max-db-size\ +passwd/) }
      end
      if v[:enable_db_group] == true
        it { should contain_file('nscd_config').with_content(/^enable-cache\ +group\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +group\ +3600$/) }
        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +group\ +60$/) }
        it { should contain_file('nscd_config').with_content(/^suggested-size\ +group\ +211$/) }
        if v[:osfamily] == 'Solaris'
          it { should contain_file('nscd_config').with_content(/^keep-hot-count\ +group\ +2048$/) }
        else
          it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +group/) }
        end
        it { should contain_file('nscd_config').with_content(/^check-files\ +group\ +yes$/) }
        if v[:osfamily] != 'Solaris'
          it { should contain_file('nscd_config').with_content(/^persistent\ +group\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^shared\ +group\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^max-db-size\ +group\ +33554432$/) }
          if v[:enable_opt_auto_propagate] == true
            it { should contain_file('nscd_config').with_content(/^auto-propagate\ +group\ +yes$/) }
          else
            it { should contain_file('nscd_config').without_content(/^auto-propagate +group/) }
          end
        end
      else
        it { should contain_file('nscd_config').without_content(/^enable-cache\ +group/) }
        it { should contain_file('nscd_config').without_content(/^positive-time-to-live\ +group/) }
        it { should contain_file('nscd_config').without_content(/^negative-time-to-live\ +group/) }
        it { should contain_file('nscd_config').without_content(/^suggested-size\ +group/) }
        it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +group/) }
        it { should contain_file('nscd_config').without_content(/^check-files\ +group/) }
        it { should contain_file('nscd_config').without_content(/^persistent\ +group/) }
        it { should contain_file('nscd_config').without_content(/^shared\ +group/) }
        it { should contain_file('nscd_config').without_content(/^max-db-size\ +group/) }
      end
      if v[:enable_db_hosts] == true
        it { should contain_file('nscd_config').with_content(/^enable-cache\ +hosts\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +hosts\ +3600$/) }
        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +hosts\ +20$/) }
        it { should contain_file('nscd_config').with_content(/^suggested-size\ +hosts\ +211$/) }
        if v[:osfamily] == 'Solaris'
          it { should contain_file('nscd_config').with_content(/^keep-hot-count\ +hosts\ +2048$/) }
        else
          it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +hosts/) }
        end
        it { should contain_file('nscd_config').with_content(/^check-files\ +hosts\ +yes$/) }
        if v[:osfamily] != 'Solaris'
          it { should contain_file('nscd_config').with_content(/^persistent\ +hosts\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^shared\ +hosts\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^max-db-size\ +hosts\ +33554432$/) }
        end
      else
        it { should contain_file('nscd_config').without_content(/^enable-cache\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^positive-time-to-live\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^negative-time-to-live\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^suggested-size\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^check-files\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^persistent\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^shared\ +hosts/) }
        it { should contain_file('nscd_config').without_content(/^max-db-size\ +hosts/) }
      end
      if v[:enable_db_services] == true
        it { should contain_file('nscd_config').with_content(/^enable-cache\ +services\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +services\ +28800$/) }
        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +services\ +20$/) }
        it { should contain_file('nscd_config').with_content(/^suggested-size\ +services\ +211$/) }
        if v[:osfamily] == 'Solaris'
          it { should contain_file('nscd_config').with_content(/^keep-hot-count\ +services\ +2048$/) }
        else
          it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +services/) }
        end
        it { should contain_file('nscd_config').with_content(/^check-files\ +services\ +yes$/) }
        if v[:osfamily] != 'Solaris'
          it { should contain_file('nscd_config').with_content(/^persistent\ +services\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^shared\ +services\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^max-db-size\ +services\ +33554432$/) }
        end
      else
        it { should contain_file('nscd_config').without_content(/^enable-cache\ +services/) }
        it { should contain_file('nscd_config').without_content(/^positive-time-to-live\ +services/) }
        it { should contain_file('nscd_config').without_content(/^negative-time-to-live\ +services/) }
        it { should contain_file('nscd_config').without_content(/^suggested-size\ +services/) }
        it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +services/) }
        it { should contain_file('nscd_config').without_content(/^check-files\ +services/) }
        it { should contain_file('nscd_config').without_content(/^persistent\ +services/) }
        it { should contain_file('nscd_config').without_content(/^shared\ +services/) }
        it { should contain_file('nscd_config').without_content(/^max-db-size\ +services/) }
      end

      services_solaris.each do |service|
        enable_service = "enable_db_#{service}"
        if v[enable_service.to_sym] == true
          it { should contain_file('nscd_config').with_content(/^enable-cache\ +#{service}\ +yes$/) }
          it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +#{service}\ +3600$/) }
          it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +#{service}\ +20$/) }
          it { should contain_file('nscd_config').with_content(/^keep-hot-count\ +#{service}\ +2048$/) }
          it { should contain_file('nscd_config').with_content(/^check-files\ +#{service}\ +yes$/) }
        else
          it { should contain_file('nscd_config').without_content(/^enable-cache\ +#{service}/) }
          it { should contain_file('nscd_config').without_content(/^positive-time-to-live\ +#{service}/) }
          it { should contain_file('nscd_config').without_content(/^negative-time-to-live\ +#{service}/) }
          it { should contain_file('nscd_config').without_content(/^keep-hot-count\ +#{service}/) }
          it { should contain_file('nscd_config').without_content(/^check-files\ +#{service}/) }
        end
      end
      if v[:enable_db_netgroup] == true
        it { should contain_file('nscd_config').with_content(/^enable-cache\ +netgroup\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +netgroup\ +28800$/) }
        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +netgroup\ +20$/) }
        it { should contain_file('nscd_config').with_content(/^suggested-size\ +netgroup\ +211$/) }
        it { should contain_file('nscd_config').with_content(/^check-files\ +netgroup\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^persistent\ +netgroup\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^shared\ +netgroup\ +yes$/) }
        it { should contain_file('nscd_config').with_content(/^max-db-size\ +netgroup\ +33554432$/) }
      else
        it { should contain_file('nscd_config').without_content(/^\s*enable-cache\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*positive-time-to-live\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*negative-time-to-live\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*suggested-size\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*check-files\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*persistent\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*shared\ +netgroup/) }
        it { should contain_file('nscd_config').without_content(/^\s*max-db-size\ +netgroup/) }
      end

      if v[:service_provider] != nil
        it do
          should contain_service('nscd_service').with({
            'ensure'    => 'running',
            'name'      => v[:service_name],
            'enable'    => 'true',
            'provider'  => v[:service_provider],
            'subscribe' => 'File[nscd_config]',
          })
        end
      else
        it do
          should contain_service('nscd_service').with({
            'ensure'    => 'running',
            'name'      => v[:service_name],
            'enable'    => 'true',
            'provider'  => nil,
            'subscribe' => 'File[nscd_config]',
          })
        end
      end
    end
  end

  describe 'on unsupported' do
    context 'osfamily' do
      let(:facts) { { :osfamily => 'unsupported' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /Nscd supports osfamilies Debian, RedHat, Suse and Solaris\. Detected osfamily is <unsupported>\./)
      end
    end

    context 'versions of EL' do
      let :facts do
        {
          :osfamily                  => 'RedHat',
          :operatingsystemmajrelease => '4',
        }
      end

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /Nscd is only supported on EL 5, 6, 7, 8 and Amazon linux 2015-2017\. Your operatingsystemmajrelease is identified as <4>\./)
      end
    end

    context 'versions of Suse' do
      let :facts do
        {
          :osfamily                  => 'Suse',
          :operatingsystemrelease    => '4.0',
          :operatingsystemmajrelease => '4',
        }
      end

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /Nscd is only supported on Suse 10, 11, 12, 13 and 15\. Your operatingsystemrelease is identified as <4\.0>\./)
      end
    end
  end

  describe 'with package_adminfile parameter specified' do
    context 'as a string' do
      let(:params) { { :package_adminfile => 'myadminfile' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_package('nscd').with({ 'adminfile' => 'myadminfile' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :package_adminfile => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::package_adminfile must be a string\./)
      end
    end
  end

  describe 'with package_source parameter specified' do
    context 'as a string' do
      let(:params) { { :package_source => 'mysource' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_package('nscd').with({ 'source' => 'mysource' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :package_source => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::package_source must be a string\./)
      end
    end
  end

  describe 'with package_name parameter specified' do
    context 'as a string' do
      let(:params) { { :package_name => 'mynscd' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_package('mynscd').with({ 'ensure' => 'present' }) }
    end

    context 'as an array' do
      let(:params) { { :package_name => %w[nscd foo] } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_package('nscd').with({ 'ensure' => 'present' }) }
      it { should contain_package('foo').with({ 'ensure' => 'present' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :package_name => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::package_name must be a string or an array\./)
      end
    end
  end

  describe 'with package_ensure parameter' do
    context 'set to all possible valid values' do
      %w[present installed absent].each do |ensure_value|
        context "package_ensure => #{ensure_value}" do
          let(:params) { { :package_ensure => ensure_value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_package('nscd').with({ 'ensure' => ensure_value.to_s }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { :package_ensure => 'invalid' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::package_ensure is invalid and does not match the regex\./)
      end
    end
  end

  describe 'with config_path parameter specified' do
    context 'as a valid path' do
      let(:params) { { :config_path => '/usr/local/etc/nscd.conf' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with({ 'path' => '/usr/local/etc/nscd.conf' }) }
    end

    context 'as an invalid value' do
      let(:params) { { :config_path => 'invalid/path' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, %r{"invalid/path" is not an absolute path})
      end
    end
  end

  describe 'with config_owner parameter specified' do
    context 'as a valid string' do
      let(:params) { { :config_owner => 'root' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with({ 'owner' => 'root' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :config_owner => %w[invalid root] } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /\["invalid", "root"\] is not a string/)
      end
    end
  end

  describe 'with config_group parameter specified' do
    context 'as a valid string' do
      let(:params) { { :config_group => 'root' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with({ 'group' => 'root' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :config_group => %w[invalid root] } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /\["invalid", "root"\] is not a string/)
      end
    end
  end

  describe 'with config_mode parameter specified' do
    context 'with valid value' do
      let(:params) { { :config_mode => '0644' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with({ 'mode' => '0644' }) }
    end

    context 'with invalid value' do
      let(:params) { { :config_mode => '644' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::config_mode is <644>. Must be in four digit octal notation\./)
      end
    end

    context 'with invalid type' do
      let(:params) { { :config_mode => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::config_mode is <true>\. Must be in four digit octal notation/)
      end
    end
  end

  describe 'with service_name parameter specified' do
    context 'as a valid string' do
      let(:params) { { :service_name => 'mynscd' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_service('nscd_service').with({ 'name' => 'mynscd' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :config_mode => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::config_mode is <true>\. Must be in four digit octal notation/)
      end
    end
  end

  describe 'with service_ensure parameter' do
    context 'set to all possible valid values' do
      %w[present running absent stopped].each do |ensure_value|
        context "service_ensure => #{ensure_value}" do
          let(:params) { { :service_ensure => ensure_value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_service('nscd_service').with({ 'ensure' => ensure_value.to_s }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { :service_ensure => 'invalid' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::service_ensure is invalid and does not match the regex\./)
      end
    end
  end

  describe 'with service_enable parameter' do
    context 'set to all possible valid values' do
      [true, false, 'true', 'false'].each do |enable_value|
        context "service_enable => #{enable_value}" do
          let(:params) { { :service_enable => enable_value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_service('nscd_service').with({ 'enable' => enable_value }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { :service_enable => 'invalid' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /Unknown type of boolean/)
      end
    end

    context 'set to invalid type' do
      let(:params) { { :service_enable => %w[invalid type] } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /\["invalid", "type"\] is not a boolean/)
      end
    end
  end

  describe 'with service_provider parameter specified' do
    context 'as a valid string' do
      let(:params) { { :service_provider => 'myprovider' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_service('nscd_service').with({ 'provider' => 'myprovider' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :service_provider => %w[not a string] } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /is not a string/)
      end
    end
  end

  %w[passwd group hosts services netgroup].each do |service|
    describe "with enable_db_#{service}" do
      [true, 'true', false, 'false'].each do |value|
        context "set to valid value #{value}" do
          let(:params) { { :"enable_db_#{service}" => value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_class('nscd') }
        end
      end

      context 'set to an invalid type (non-boolean or string convertible to boolean)' do
        let(:params) { { :"enable_db_#{service}" => %w[invalid type] } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /Requires either string to work with/)
        end
      end
    end
  end

  describe 'with enable_opt_auto_propagate' do
    [true, 'true', false, 'false'].each do |value|
      context "set to valid value #{value}" do
        let(:params) { { :enable_opt_auto_propagate => value } }
        let(:facts) { { :osfamily => 'Debian' } }

        it { should contain_class('nscd') }
      end
    end

    context 'set to an invalid type (non-boolean or string convertible to boolean)' do
      let(:params) { { :enable_opt_auto_propagate => %w[invalid type] } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /Requires either string to work with/)
      end
    end
  end

  describe 'with logfile parameter specified' do
    context 'with a valid path' do
      let(:params) { { :logfile => '/path/to/nscd.log' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(%r{^logfile\ +/path/to/nscd\.log$}) }
    end

    context 'as an invalid path' do
      let(:params) { { :logfile => 'invalid/path' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, %r{"invalid/path" is not an absolute path})
      end
    end

    context 'as an invalid type' do
      let(:params) { { :logfile => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /true is not an absolute path/)
      end
    end
  end

  describe 'with threads parameter specified' do
    context 'as a valid number' do
      let(:params) { { :threads => '23' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^threads\ +23$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :threads => 'x' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::threads is <x>\. Must be a number\./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :threads => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::threads is <true>\. Must be a number/)
      end
    end
  end

  describe 'with max_threads parameter specified' do
    context 'as a valid number' do
      let(:params) { { :max_threads => '42' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^max-threads\ +42$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :max_threads => 'x' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::max_threads is <x>\. Must be a number\./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :max_threads => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::max_threads is <true>. Must be a number/)
      end
    end
  end

  describe 'with server_user parameter' do
    context 'specified as a valid string' do
      let(:params) { { :server_user => 'root' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^server-user\ +root$/) }
    end

    context 'not specified' do
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').without_content(/^\s*server-user/) }
    end
  end

  describe 'with stat_user parameter' do
    context 'specified as a valid string' do
      let(:params) { { :stat_user => 'lmcdtre' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^stat-user\ +lmcdtre$/) }
    end

    context 'as an invalid type' do
      let(:params) { { :stat_user => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /true is not a string\.  It looks to be a TrueClass/)
      end
    end
  end

  describe 'with debug_level parameter specified' do
    context 'as a valid number' do
      let(:params) { { :debug_level => '5' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^debug-level\ +5$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :debug_level => 'x' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::debug_level is <x>\. Must be a number\./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :debug_level => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::debug_level is <true>\. Must be a number/)
      end
    end
  end

  describe 'with reload_count parameter specified' do
    context 'as a valid number' do
      let(:params) { { :reload_count => '5' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^reload-count\ +5$/) }
      let(:facts) { { :osfamily => 'Debian' } }
    end

    context 'as \'unlimited\'' do
      let(:params) { { :reload_count => 'unlimited' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^reload-count\ +unlimited$/) }
    end

    ['unlimitedd', 'invalid', '-1'].each do |value|
      context "as invalid value #{value}" do
        let(:params) { { :reload_count => value } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::reload_count is <#{value}>\. Must be a number or 'unlimited'\./)
        end
      end
    end

    context 'as an invalid type' do
      let(:params) { { :reload_count => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::reload_count is <true>\. Must be a number or 'unlimited'/)
      end
    end
  end

  describe 'with paranoia parameter specified' do
    %w[yes no].each do |value|
      context "as valid value #{value}" do
        let(:params) { { :paranoia => value } }
        let(:facts) { { :osfamily => 'Debian' } }

        it { should contain_file('nscd_config').with_content(/^paranoia\ +#{value}$/) }
      end
    end

    ['yess', 'nooo', '-1', true].each do |value|
      context "as invalid value #{value}" do
        let(:params) { { :paranoia => value } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::paranoia is <#{value}>\. Must be either 'yes' or 'no'\./)
        end
      end
    end
  end

  describe 'with restart_interval parameter specified' do
    context 'as a valid number' do
      let(:params) { { :restart_interval => '31415' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it { should contain_file('nscd_config').with_content(/^restart-interval\ +31415$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :restart_interval => 'x' } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::restart_interval is <x>\. Must be a number in seconds\./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :restart_interval => true } }
      let(:facts) { { :osfamily => 'Debian' } }

      it 'should fail' do
        expect do
          should contain_class('nscd')
        end.to raise_error(Puppet::Error, /nscd::restart_interval is <true>\. Must be a number in seconds\./)
      end
    end
  end

  %w[passwd group hosts services netgroup].each do |service|
    describe "with #{service}_enable_cache specified" do
      %w[yes no].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              :"enable_db_#{service}"    => true,
              :"#{service}_enable_cache" => value,
            }
          end
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_file('nscd_config').with_content(/^enable-cache\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_enable_cache" => value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it 'should fail' do
            expect do
              should contain_class('nscd')
            end.to raise_error(Puppet::Error, /nscd::#{service}_enable_cache is <#{value}>\. Must be either 'yes' or 'no'\./)
          end
        end
      end
    end

    describe "with #{service}_positive_time_to_live specified" do
      context 'as a valid number' do
        let :params do
          {
            :"enable_db_#{service}"             => true,
            :"#{service}_positive_time_to_live" => '31415',
          }
        end
        let(:facts) { { :osfamily => 'Debian' } }

        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +#{service}\ +31415$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_positive_time_to_live" => 'x' } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_positive_time_to_live is <x>\. Must be a number in seconds\./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_positive_time_to_live" => true } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_positive_time_to_live is <true>\. Must be a number in seconds\./)
        end
      end
    end

    describe "with #{service}_negative_time_to_live specified" do
      context 'as a valid number' do
        let :params do
          {
            :"enable_db_#{service}"             => true,
            :"#{service}_negative_time_to_live" => '23',
          }
        end
        let(:facts) { { :osfamily => 'Debian' } }

        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +#{service}\ +23$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_negative_time_to_live" => 'x' } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_negative_time_to_live is <x>\. Must be a number in seconds\./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_negative_time_to_live" => true } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_negative_time_to_live is <true>\. Must be a number in seconds\./)
        end
      end
    end

    describe "with #{service}_suggested_size specified" do
      context 'as a valid number' do
        let :params do
          {
            :"enable_db_#{service}"      => true,
            :"#{service}_suggested_size" => '411',
          }
        end
        let(:facts) { { :osfamily => 'Debian' } }

        it { should contain_file('nscd_config').with_content(/^suggested-size\ +#{service}\ +411$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_suggested_size" => 'x' } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_suggested_size is <x>\. Must be a number\./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_suggested_size" => true } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_suggested_size is <true>\. Must be a number\./)
        end
      end
    end

    describe "with #{service}_check_files specified" do
      %w[yes no].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              :"enable_db_#{service}"   => true,
              :"#{service}_check_files" => value,
            }
          end
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_file('nscd_config').with_content(/^check-files\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_check_files" => value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it 'should fail' do
            expect do
              should contain_class('nscd')
            end.to raise_error(Puppet::Error, /nscd::#{service}_check_files is <#{value}>\. Must be either 'yes' or 'no'\./)
          end
        end
      end
    end

    describe "with #{service}_persistent specified" do
      %w[yes no].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              :"enable_db_#{service}"  => true,
              :"#{service}_persistent" => value,
            }
          end
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_file('nscd_config').with_content(/^persistent\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_persistent" => value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it 'should fail' do
            expect do
              should contain_class('nscd')
            end.to raise_error(Puppet::Error, /nscd::#{service}_persistent is <#{value}>\. Must be either 'yes' or 'no'\./)
          end
        end
      end
    end

    describe "with #{service}_shared specified" do
      %w[yes no].each do |value|
        context "as valid value #{value}" do
          let :params do
            {
              :"enable_db_#{service}" => true,
              :"#{service}_shared"    => value,
            }
          end
          let(:facts) { { :osfamily => 'Debian' } }

          it { should contain_file('nscd_config').with_content(/^shared\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_shared" => value } }
          let(:facts) { { :osfamily => 'Debian' } }

          it 'should fail' do
            expect do
              should contain_class('nscd')
            end.to raise_error(Puppet::Error, /nscd::#{service}_shared is <#{value}>\. Must be either 'yes' or 'no'\./)
          end
        end
      end
    end

    describe "with #{service}_max_db_size specified" do
      context 'as a valid number' do
        let :params do
          {
            :"enable_db_#{service}"   => true,
            :"#{service}_max_db_size" => '1000000',
          }
        end
        let(:facts) { { :osfamily => 'Debian' } }

        it { should contain_file('nscd_config').with_content(/^max-db-size\ +#{service}\ +1000000$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_max_db_size" => 'x' } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_max_db_size is <x>\. Must be a number in bytes\./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_max_db_size" => true } }
        let(:facts) { { :osfamily => 'Debian' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_max_db_size is <true>\. Must be a number in bytes\./)
        end
      end
    end

    # only the passwd and group services use auto-propogate
    if service == 'passwd' || service == 'group'
      describe "with #{service}_auto_propagate specified" do
        %w[yes no].each do |value|
          context "as valid value #{value}" do
            let :params do
              {
                :"enable_db_#{service}"      => true,
                :"#{service}_auto_propagate" => value,
              }
            end
            let(:facts) { { :osfamily => 'Debian' } }

            it { should contain_file('nscd_config').with_content(/^auto-propagate\ +#{service}\ +#{value}$/) }
          end
        end

        ['yess', 'nooo', '-1', true].each do |value|
          context "as invalid value #{value}" do
            let(:params) { { :"#{service}_auto_propagate" => value } }
            let(:facts) { { :osfamily => 'Debian' } }

            it 'should fail' do
              expect do
                should contain_class('nscd')
              end.to raise_error(Puppet::Error, /nscd::#{service}_auto_propagate is <#{value}>\. Must be either 'yes' or 'no'\./)
            end
          end
        end
      end
    end
  end

  services_solaris.each do |service|
    describe "with #{service}_enable_cache specified" do
      %w[yes no].each do |value|
        context "as valid value #{value}" do
          let(:params) { { :"#{service}_enable_cache" => value } }
          let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

          it { should contain_file('nscd_config').with_content(/^enable-cache\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_enable_cache" => value } }
          let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

          it 'should fail' do
            expect do
              should contain_class('nscd')
            end.to raise_error(Puppet::Error, /nscd::#{service}_enable_cache is <#{value}>\. Must be either 'yes' or 'no'\./)
          end
        end
      end
    end

    describe "with #{service}_positive_time_to_live specified" do
      context 'as a valid number' do
        let(:params) { { :"#{service}_positive_time_to_live" => '31415' } }
        let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +#{service}\ +31415$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_positive_time_to_live" => 'x' } }
        let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_positive_time_to_live is <x>\. Must be a number in seconds\./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_positive_time_to_live" => true } }
        let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error)
        end
      end
    end

    describe "with #{service}_negative_time_to_live specified" do
      context 'as a valid number' do
        let(:params) { { :"#{service}_negative_time_to_live" => '23' } }
        let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +#{service}\ +23$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_negative_time_to_live" => 'x' } }
        let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error, /nscd::#{service}_negative_time_to_live is <x>\. Must be a number in seconds\./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_negative_time_to_live" => true } }
        let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

        it 'should fail' do
          expect do
            should contain_class('nscd')
          end.to raise_error(Puppet::Error)
        end
      end
    end

    describe "with #{service}_check_files specified" do
      %w[yes no].each do |value|
        context "as valid value #{value}" do
          let(:params) { { :"#{service}_check_files" => value } }
          let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

          it { should contain_file('nscd_config').with_content(/^check-files\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess', 'nooo', '-1', true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_check_files" => value } }
          let(:facts) { { :osfamily => 'Solaris', :kernelrelease => '5.10' } }

          it 'should fail' do
            expect do
              should contain_class('nscd')
            end.to raise_error(Puppet::Error, /nscd::#{service}_check_files is <#{value}>\. Must be either 'yes' or 'no'\./)
          end
        end
      end
    end
  end
end
