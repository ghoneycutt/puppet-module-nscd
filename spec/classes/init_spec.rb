require 'spec_helper'
describe 'nscd' do

  context 'with default options' do

    it { should include_class('nscd') }

    it {
      should contain_package('nscd_package').with({
        'ensure' => 'present',
        'name'   => 'nscd',
      })
    }

    it {
      should contain_file('nscd_config').with({
        'ensure'  => 'file',
        'path'    => '/etc/nscd.conf',
        'owner'   => 'root',
        'group'   => 'root',
        'mode'    => '0644',
        'require' => 'Package[nscd_package]',
      })
    }

    it { should contain_file('nscd_config').with_content(/^logfile \/var\/log\/nscd.log$/) }
    it { should contain_file('nscd_config').with_content(/^threads 4$/) }
    it { should contain_file('nscd_config').with_content(/^max-threads 32$/) }
    it { should contain_file('nscd_config').with_content(/^server-user nscd$/) }
    it { should contain_file('nscd_config').with_content(/^stat-user root$/) }
    it { should contain_file('nscd_config').with_content(/^debug-level 0$/) }
    it { should contain_file('nscd_config').with_content(/^reload-count 5$/) }
    it { should contain_file('nscd_config').with_content(/^paranoia no$/) }
    it { should contain_file('nscd_config').with_content(/^restart-interval 3600$/) }
    it { should contain_file('nscd_config').with_content(/^enable-cache passwd yes$/) }
    it { should contain_file('nscd_config').with_content(/^positive-time-to-live passwd 600$/) }
    it { should contain_file('nscd_config').with_content(/^negative-time-to-live passwd 20$/) }
    it { should contain_file('nscd_config').with_content(/^suggested-size passwd 211$/) }
    it { should contain_file('nscd_config').with_content(/^check-files passwd yes$/) }
    it { should contain_file('nscd_config').with_content(/^persistent passwd yes$/) }
    it { should contain_file('nscd_config').with_content(/^shared passwd yes$/) }
    it { should contain_file('nscd_config').with_content(/^max-db-size passwd 33554432$/) }
    it { should contain_file('nscd_config').with_content(/^auto-propagate passwd yes$/) }
    it { should contain_file('nscd_config').with_content(/^enable-cache group yes$/) }
    it { should contain_file('nscd_config').with_content(/^positive-time-to-live group 3600$/) }
    it { should contain_file('nscd_config').with_content(/^negative-time-to-live group 60$/) }
    it { should contain_file('nscd_config').with_content(/^suggested-size group 211$/) }
    it { should contain_file('nscd_config').with_content(/^check-files group yes$/) }
    it { should contain_file('nscd_config').with_content(/^persistent group yes$/) }
    it { should contain_file('nscd_config').with_content(/^shared group yes$/) }
    it { should contain_file('nscd_config').with_content(/^max-db-size group 33554432$/) }
    it { should contain_file('nscd_config').with_content(/^auto-propagate group yes$/) }
    it { should contain_file('nscd_config').with_content(/^enable-cache hosts yes$/) }
    it { should contain_file('nscd_config').with_content(/^positive-time-to-live hosts 3600$/) }
    it { should contain_file('nscd_config').with_content(/^negative-time-to-live hosts 20$/) }
    it { should contain_file('nscd_config').with_content(/^suggested-size hosts 211$/) }
    it { should contain_file('nscd_config').with_content(/^check-files hosts yes$/) }
    it { should contain_file('nscd_config').with_content(/^persistent hosts yes$/) }
    it { should contain_file('nscd_config').with_content(/^shared hosts yes$/) }
    it { should contain_file('nscd_config').with_content(/^max-db-size hosts 33554432$/) }
    it { should contain_file('nscd_config').with_content(/^enable-cache services yes$/) }
    it { should contain_file('nscd_config').with_content(/^positive-time-to-live services 28800$/) }
    it { should contain_file('nscd_config').with_content(/^negative-time-to-live services 20$/) }
    it { should contain_file('nscd_config').with_content(/^suggested-size services 211$/) }
    it { should contain_file('nscd_config').with_content(/^check-files services yes$/) }
    it { should contain_file('nscd_config').with_content(/^persistent services yes$/) }
    it { should contain_file('nscd_config').with_content(/^shared services yes$/) }
    it { should contain_file('nscd_config').with_content(/^max-db-size services 33554432$/) }

    it {
      should contain_service('nscd_service').with({
        'ensure'    => 'running',
        'name'      => 'nscd',
        'enable'    => 'true',
        'subscribe' => 'File[nscd_config]',
      })
    }
  end

  describe 'with package_name param specified' do
    let(:params) { { :package_name => 'mynscd' } }

    it {
      should contain_package('nscd_package').with({
        'name'   => 'mynscd',
      })
    }
  end

  describe 'with package_ensure param set to all possible valid values' do
    %w{present installed absent}.each do |ensure_value|
      context "package_ensure => #{ensure_value}" do
        let(:params) { { :package_ensure => ensure_value } }

        it {
          should contain_package('nscd_package').with({
            'ensure' => "#{ensure_value}",
          })
        }
      end
    end
  end

  describe 'with package_ensure param set to invalid value' do
    let(:params) { { :package_ensure => 'invalid' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error,/nscd::package_ensure is invalid and does not match the regex./)
    end
  end

  describe 'with config_path param specified' do
    let(:params) { { :config_path => '/usr/local/etc/nscd.conf' } }

    it {
      should contain_file('nscd_config').with({
        'path' => '/usr/local/etc/nscd.conf',
      })
    }
  end

  describe 'with config_path param set to invalid value' do
    let(:params) { { :config_path => 'invalid/path' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error)
    end
  end

  describe 'with config_owner param specified' do
    let(:params) { { :config_owner => 'root' } }

    it {
      should contain_file('nscd_config').with({
        'owner' => 'root',
      })
    }
  end

  describe 'with config_group param specified' do
    let(:params) { { :config_group => 'root' } }

    it {
      should contain_file('nscd_config').with({
        'group' => 'root',
      })
    }
  end

  describe 'with config_mode param specified' do
    let(:params) { { :config_mode => '0640' } }

    it {
      should contain_file('nscd_config').with({
        'mode' => '0640',
      })
    }
  end

  describe 'with config_mode param set to invalid value' do
    let(:params) { { :config_mode => '644' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error,/nscd::config_mode is <644>. Must be in four digit octal notation./)
    end
  end

  describe 'with service_name param specified' do
    let(:params) { { :service_name => 'mynscd' } }

    it {
      should contain_service('nscd_service').with({
        'name'   => 'mynscd',
      })
    }
  end

  describe 'with service_ensure param set to all possible valid values' do
    %w{present running absent stopped}.each do |ensure_value|
      context "service_ensure => #{ensure_value}" do
        let(:params) { { :service_ensure => ensure_value } }

        it {
          should contain_service('nscd_service').with({
            'ensure' => "#{ensure_value}",
          })
        }
      end
    end
  end

  describe 'with service_ensure param set to invalid value' do
    let(:params) { { :service_ensure => 'invalid' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error,/nscd::service_ensure is invalid and does not match the regex./)
    end
  end

  describe 'with service_enable param set to all possible valid values' do
    [true, false, 'true', 'false'].each do |enable_value|
      context "service_enable => #{enable_value}" do
        let(:params) { { :service_enable => enable_value } }

        it {
          should contain_service('nscd_service').with({
            'enable' => enable_value,
          })
        }
      end
    end
  end

  describe 'with service_enable param set to invalid value' do
    let(:params) { { :service_enable => 'invalid' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error)
    end
  end

  describe 'with logfile param specified' do
    let(:params) { { :logfile => '/path/to/nscd.log' } }

    it { should contain_file('nscd_config').with_content(/^logfile \/path\/to\/nscd.log$/) }
  end

  describe 'with logfile param set to invalid value' do
    let(:params) { { :logfile => 'invalid/path' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error)
    end
  end

  describe 'with threads param specified' do
    [23, '23'].each do |thread_value|
      context "as type #{thread_value.class} with value #{thread_value}" do
        let(:params) { { :threads => thread_value } }

        it { should contain_file('nscd_config').with_content(/^threads 23$/) }
      end
    end
  end

  describe 'with threads param set to invalid value' do
    let(:params) { { :threads => 'x' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error,/nscd::threads is <x>. Must be a number./)
    end
  end

  describe 'with max_threads param specified' do
    [42, '42'].each do |thread_value|
      context "as type #{thread_value.class} with value #{thread_value}" do
        let(:params) { { :max_threads => thread_value } }

        it { should contain_file('nscd_config').with_content(/^max-threads 42$/) }
      end
    end
  end

  describe 'with max_threads param set to invalid value' do
    let(:params) { { :max_threads => 'x' } }

    it 'should fail' do
      expect {
        should include_class('nscd')
      }.to raise_error(Puppet::Error,/nscd::max_threads is <x>. Must be a number./)
    end
  end

  describe 'with server_user param specified' do
    let(:params) { { :server_user => 'root' } }

    it { should contain_file('nscd_config').with_content(/^server-user root$/) }
  end
end
