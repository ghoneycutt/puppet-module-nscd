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
end
