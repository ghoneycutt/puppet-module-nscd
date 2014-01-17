require 'spec_helper'
describe 'nscd' do

  platforms = {
    'debian6' =>
      { :osfamily           => 'Debian',
        :lsbmajdistrelease  => '6',
        :package_name       => 'nscd',
        :server_user        => nil,
      },
    'el5' =>
      { :osfamily           => 'RedHat',
        :lsbmajdistrelease  => '5',
        :package_name       => 'nscd',
        :server_user        => 'nscd',
      },
    'el6' =>
      { :osfamily           => 'RedHat',
        :lsbmajdistrelease  => '6',
        :package_name       => 'nscd',
        :server_user        => 'nscd',
      },
    'suse10' =>
      { :osfamily           => 'Suse',
        :lsbmajdistrelease  => '10',
        :package_name       => 'nscd',
        :server_user        => nil,
      },
    'suse11' =>
      { :osfamily           => 'Suse',
        :lsbmajdistrelease  => '11',
        :package_name       => 'nscd',
        :server_user        => nil,
      },
    'ubuntu12' =>
      { :osfamily           => 'Debian',
        :lsbmajdistrelease  => '12',
        :package_name       => 'nscd',
        :server_user        => nil,
      },
  }

  platforms.sort.each do |k,v|
    describe "on #{v[:osfamily]} #{v[:lsbmajdistrelease]} with default values for all parameters" do
      let(:facts) do
        { :lsbmajdistrelease => v[:lsbmajdistrelease],
          :osfamily          => v[:osfamily],
        }
      end

      it { should compile.with_all_deps }

      it { should contain_class('nscd') }

      it {
        should contain_package(v[:package_name]).with({
          'ensure' => 'present',
        })
      }

      it {
        should contain_file('nscd_config').with({
          'ensure'  => 'file',
          'path'    => '/etc/nscd.conf',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
          'require' => "Package[#{v[:package_name]}]",
        })
      }

      it { should contain_file('nscd_config').with_content(/^logfile\ +\/var\/log\/nscd.log$/) }
      it { should contain_file('nscd_config').with_content(/^threads\ +5$/) }
      it { should contain_file('nscd_config').with_content(/^max-threads\ +32$/) }
      if v[:server_user] != nil
        it { should contain_file('nscd_config').with_content(/^server-user\ +#{v[:server_user]}$/) }
      else
        it { should_not contain_file('nscd_config').with_content(/^server-user/) }
      end
      it { should contain_file('nscd_config').with_content(/^stat-user\ +root$/) }
      it { should contain_file('nscd_config').with_content(/^debug-level\ +0$/) }
      it { should contain_file('nscd_config').with_content(/^reload-count\ +5$/) }
      it { should contain_file('nscd_config').with_content(/^paranoia\ +no$/) }
      it { should contain_file('nscd_config').with_content(/^restart-interval\ +3600$/) }
      it { should contain_file('nscd_config').with_content(/^enable-cache\ +passwd\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +passwd\ +600$/) }
      it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +passwd\ +20$/) }
      it { should contain_file('nscd_config').with_content(/^suggested-size\ +passwd\ +211$/) }
      it { should contain_file('nscd_config').with_content(/^check-files\ +passwd\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^persistent\ +passwd\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^shared\ +passwd\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^max-db-size\ +passwd\ +33554432$/) }
      it { should contain_file('nscd_config').with_content(/^auto-propagate\ +passwd\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^enable-cache\ +group\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +group\ +3600$/) }
      it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +group\ +60$/) }
      it { should contain_file('nscd_config').with_content(/^suggested-size\ +group\ +211$/) }
      it { should contain_file('nscd_config').with_content(/^check-files\ +group\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^persistent\ +group\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^shared\ +group\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^max-db-size\ +group\ +33554432$/) }
      it { should contain_file('nscd_config').with_content(/^auto-propagate\ +group\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^enable-cache\ +hosts\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +hosts\ +3600$/) }
      it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +hosts\ +20$/) }
      it { should contain_file('nscd_config').with_content(/^suggested-size\ +hosts\ +211$/) }
      it { should contain_file('nscd_config').with_content(/^check-files\ +hosts\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^persistent\ +hosts\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^shared\ +hosts\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^max-db-size\ +hosts\ +33554432$/) }
      it { should contain_file('nscd_config').with_content(/^enable-cache\ +services\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +services\ +28800$/) }
      it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +services\ +20$/) }
      it { should contain_file('nscd_config').with_content(/^suggested-size\ +services\ +211$/) }
      it { should contain_file('nscd_config').with_content(/^check-files\ +services\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^persistent\ +services\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^shared\ +services\ +yes$/) }
      it { should contain_file('nscd_config').with_content(/^max-db-size\ +services\ +33554432$/) }

      it {
        should contain_service('nscd_service').with({
          'ensure'    => 'running',
          'name'      => 'nscd',
          'enable'    => 'true',
          'subscribe' => 'File[nscd_config]',
        })
      }
    end
  end

  describe 'with package_name parameter specified' do
    context 'as a string' do
      let(:params) { { :package_name => 'mynscd' } }

      it { should contain_package('mynscd').with({'ensure' => 'present' }) }
    end

    context 'as an array' do
      let(:params) { { :package_name => ['nscd','foo'] } }

      it { should contain_package('nscd').with({'ensure' => 'present' }) }
      it { should contain_package('foo').with({'ensure' => 'present' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :package_name => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::package_name must be a string or an array. Detected type is <boolean>./)
      end
    end
  end

  describe 'with package_ensure parameter' do
    context 'set to all possible valid values' do
      %w{present installed absent}.each do |ensure_value|
        context "package_ensure => #{ensure_value}" do
          let(:params) { { :package_ensure => ensure_value } }

          it { should contain_package('nscd').with({ 'ensure' => "#{ensure_value}" }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { :package_ensure => 'invalid' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::package_ensure is invalid and does not match the regex./)
      end
    end
  end

  describe 'with config_path parameter specified' do
    context 'as a valid path' do
      let(:params) { { :config_path => '/usr/local/etc/nscd.conf' } }

      it { should contain_file('nscd_config').with({ 'path' => '/usr/local/etc/nscd.conf' }) }
    end

    context 'as an invalid value' do
      let(:params) { { :config_path => 'invalid/path' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with config_owner parameter specified' do
    context 'as a valid string' do
      let(:params) { { :config_owner => 'root' } }

      it { should contain_file('nscd_config').with({ 'owner' => 'root' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :config_owner => ['invalid','root'] } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with config_group parameter specified' do
    context 'as a valid string' do
      let(:params) { { :config_group => 'root' } }

      it { should contain_file('nscd_config').with({ 'group' => 'root' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :config_group => ['invalid','root'] } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with config_mode parameter specified' do
    context 'with valid value' do
      let(:params) { { :config_mode => '0644' } }

      it { should contain_file('nscd_config').with({ 'mode' => '0644' }) }
    end

    context 'with invalid value' do
      let(:params) { { :config_mode => '644' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::config_mode is <644>. Must be in four digit octal notation./)
      end
    end

    context 'with invalid type' do
      let(:params) { { :config_mode => ['0','644'] } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with service_name parameter specified' do
    context 'as a valid string' do
      let(:params) { { :service_name => 'mynscd' } }

      it { should contain_service('nscd_service').with({ 'name' => 'mynscd' }) }
    end

    context 'as an invalid type' do
      let(:params) { { :config_mode => ['not','a','string'] } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with service_ensure parameter' do
    context 'set to all possible valid values' do
      %w{present running absent stopped}.each do |ensure_value|
        context "service_ensure => #{ensure_value}" do
          let(:params) { { :service_ensure => ensure_value } }

          it { should contain_service('nscd_service').with({ 'ensure' => "#{ensure_value}" }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { :service_ensure => 'invalid' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::service_ensure is invalid and does not match the regex./)
      end
    end
  end

  describe 'with service_enable parameter' do
    context 'set to all possible valid values' do
      [true, false, 'true', 'false'].each do |enable_value|
        context "service_enable => #{enable_value}" do
          let(:params) { { :service_enable => enable_value } }

          it { should contain_service('nscd_service').with({ 'enable' => enable_value }) }
        end
      end
    end

    context 'set to invalid value' do
      let(:params) { { :service_enable => 'invalid' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end

    context 'set to invalid type' do
      let(:params) { { :service_enable => ['invalid','type'] } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with logfile parameter specified' do
    context 'with a valid path' do
      let(:params) { { :logfile => '/path/to/nscd.log' } }

      it { should contain_file('nscd_config').with_content(/^logfile\ +\/path\/to\/nscd.log$/) }
    end

    context 'as an invalid path' do
      let(:params) { { :logfile => 'invalid/path' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :logfile => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with threads parameter specified' do
    context 'as a valid number' do
      let(:params) { { :threads => '23' } }

      it { should contain_file('nscd_config').with_content(/^threads\ +23$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :threads => 'x' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::threads is <x>. Must be a number./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :threads => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with max_threads parameter specified' do
    context 'as a valid number' do
      let(:params) { { :max_threads => '42' } }

      it { should contain_file('nscd_config').with_content(/^max-threads\ +42$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :max_threads => 'x' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::max_threads is <x>. Must be a number./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :max_threads => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with server_user parameter' do
    context 'specified as a valid string' do
      let(:params) { { :server_user => 'root' } }

      it { should contain_file('nscd_config').with_content(/^server-user\ +root$/) }
    end

    context 'not specified' do
      it { should_not contain_file('nscd_config').with_content(/^server-user/) }
    end
  end

  describe 'with stat_user parameter' do
    context 'specified as a valid string' do
      let(:params) { { :stat_user => 'lmcdtre' } }

      it { should contain_file('nscd_config').with_content(/^stat-user\ +lmcdtre$/) }
    end

    context 'as an invalid type' do
      let(:params) { { :stat_user => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with debug_level parameter specified' do
    context 'as a valid number' do
      let(:params) { { :debug_level => '5' } }

      it { should contain_file('nscd_config').with_content(/^debug-level\ +5$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :debug_level => 'x' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::debug_level is <x>. Must be a number./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :debug_level => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with reload_count parameter specified' do
    context 'as a valid number' do
      let(:params) { { :reload_count => '5' } }

      it { should contain_file('nscd_config').with_content(/^reload-count\ +5$/) }
    end

    context 'as \'unlimited\'' do
      let(:params) { { :reload_count => 'unlimited' } }

      it { should contain_file('nscd_config').with_content(/^reload-count\ +unlimited$/) }
    end

    ['unlimitedd','invalid','-1'].each do |value|
      context "as invalid value #{value}" do
        let(:params) { { :reload_count => value } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error,/^nscd::reload_count is <#{value}>. Must be a number or 'unlimited'./)
        end
      end
    end

    context 'as an invalid type' do
      let(:params) { { :reload_count => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  describe 'with paranoia parameter specified' do
    ['yes','no'].each do |value|
      context "as valid value #{value}" do
        let(:params) { { :paranoia => value } }

        it { should contain_file('nscd_config').with_content(/^paranoia\ +#{value}$/) }
      end
    end

    ['yess','nooo','-1',true].each do |value|
      context "as invalid value #{value}" do
        let(:params) { { :paranoia => value } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error,/^nscd::paranoia is <#{value}>. Must be either 'yes' or 'no'./)
        end
      end
    end
  end

  describe 'with restart_interval parameter specified' do
    context 'as a valid number' do
      let(:params) { { :restart_interval => '31415' } }

      it { should contain_file('nscd_config').with_content(/^restart-interval\ +31415$/) }
    end

    context 'as an invalid value' do
      let(:params) { { :restart_interval => 'x' } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error,/^nscd::restart_interval is <x>. Must be a number in seconds./)
      end
    end

    context 'as an invalid type' do
      let(:params) { { :restart_interval => true } }

      it 'should fail' do
        expect {
          should contain_class('nscd')
        }.to raise_error(Puppet::Error)
      end
    end
  end

  ['passwd','group','hosts','services'].each do |service|
    describe "with #{service}_enable_cache specified" do
      ['yes','no'].each do |value|
        context "as valid value #{value}" do
          let(:params) { { :"#{service}_enable_cache" => value } }

          it { should contain_file('nscd_config').with_content(/^enable-cache\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess','nooo','-1',true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_enable_cache" => value } }

          it 'should fail' do
            expect {
              should contain_class('nscd')
            }.to raise_error(Puppet::Error,/^nscd::#{service}_enable_cache is <#{value}>. Must be either 'yes' or 'no'./)
          end
        end
      end
    end

    describe "with #{service}_positive_time_to_live specified" do
      context 'as a valid number' do
        let(:params) { { :"#{service}_positive_time_to_live" => '31415' } }

        it { should contain_file('nscd_config').with_content(/^positive-time-to-live\ +#{service}\ +31415$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_positive_time_to_live" => 'x' } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error,/^nscd::#{service}_positive_time_to_live is <x>. Must be a number in seconds./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_positive_time_to_live" => true } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error)
        end
      end
    end

    describe "with #{service}_negative_time_to_live specified" do
      context 'as a valid number' do
        let(:params) { { :"#{service}_negative_time_to_live" => '23' } }

        it { should contain_file('nscd_config').with_content(/^negative-time-to-live\ +#{service}\ +23$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_negative_time_to_live" => 'x' } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error,/^nscd::#{service}_negative_time_to_live is <x>. Must be a number in seconds./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_negative_time_to_live" => true } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error)
        end
      end
    end

    describe "with #{service}_suggested_size specified" do
      context 'as a valid number' do
        let(:params) { { :"#{service}_suggested_size" => '411' } }

        it { should contain_file('nscd_config').with_content(/^suggested-size\ +#{service}\ +411$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_suggested_size" => 'x' } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error,/^nscd::#{service}_suggested_size is <x>. Must be a number./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_suggested_size" => true } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error)
        end
      end
    end

    describe "with #{service}_check_files specified" do
      ['yes','no'].each do |value|
        context "as valid value #{value}" do
          let(:params) { { :"#{service}_check_files" => value } }

          it { should contain_file('nscd_config').with_content(/^check-files\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess','nooo','-1',true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_check_files" => value } }

          it 'should fail' do
            expect {
              should contain_class('nscd')
            }.to raise_error(Puppet::Error,/^nscd::#{service}_check_files is <#{value}>. Must be either 'yes' or 'no'./)
          end
        end
      end
    end

    describe "with #{service}_persistent specified" do
      ['yes','no'].each do |value|
        context "as valid value #{value}" do
          let(:params) { { :"#{service}_persistent" => value } }

          it { should contain_file('nscd_config').with_content(/^persistent\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess','nooo','-1',true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_persistent" => value } }

          it 'should fail' do
            expect {
              should contain_class('nscd')
            }.to raise_error(Puppet::Error,/^nscd::#{service}_persistent is <#{value}>. Must be either 'yes' or 'no'./)
          end
        end
      end
    end

    describe "with #{service}_shared specified" do
      ['yes','no'].each do |value|
        context "as valid value #{value}" do
          let(:params) { { :"#{service}_shared" => value } }

          it { should contain_file('nscd_config').with_content(/^shared\ +#{service}\ +#{value}$/) }
        end
      end

      ['yess','nooo','-1',true].each do |value|
        context "as invalid value #{value}" do
          let(:params) { { :"#{service}_shared" => value } }

          it 'should fail' do
            expect {
              should contain_class('nscd')
            }.to raise_error(Puppet::Error,/^nscd::#{service}_shared is <#{value}>. Must be either 'yes' or 'no'./)
          end
        end
      end
    end

    describe "with #{service}_max_db_size specified" do
      context 'as a valid number' do
        let(:params) { { :"#{service}_max_db_size" => '1000000' } }

        it { should contain_file('nscd_config').with_content(/^max-db-size\ +#{service}\ +1000000$/) }
      end

      context 'as an invalid value' do
        let(:params) { { :"#{service}_max_db_size" => 'x' } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error,/^nscd::#{service}_max_db_size is <x>. Must be a number./)
        end
      end

      context 'as an invalid type' do
        let(:params) { { :"#{service}_max_db_size" => true } }

        it 'should fail' do
          expect {
            should contain_class('nscd')
          }.to raise_error(Puppet::Error)
        end
      end
    end

    # only the passwd and group services use auto-propogate
    if service == 'passwd' or service == 'group'
      describe "with #{service}_auto_propagate specified" do
        ['yes','no'].each do |value|
          context "as valid value #{value}" do
            let(:params) { { :"#{service}_auto_propagate" => value } }

            it { should contain_file('nscd_config').with_content(/^auto-propagate\ +#{service}\ +#{value}$/) }
          end
        end

        ['yess','nooo','-1',true].each do |value|
          context "as invalid value #{value}" do
            let(:params) { { :"#{service}_auto_propagate" => value } }

            it 'should fail' do
              expect {
                should contain_class('nscd')
              }.to raise_error(Puppet::Error,/^nscd::#{service}_auto_propagate is <#{value}>. Must be either 'yes' or 'no'./)
            end
          end
        end
      end
    end
  end
end
