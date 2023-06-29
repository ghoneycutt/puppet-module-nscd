require 'spec_helper'
describe 'nscd' do
  # The following tests are OS independent, so we only test one
  redhat = {
    supported_os: [
      {
        'operatingsystem'        => 'RedHat',
        'operatingsystemrelease' => ['8'],
      },
    ],
  }

  on_supported_os(redhat).sort.each do |_os, os_facts|
    describe 'variable type and content validations' do
      let(:facts) { os_facts }

      validations = {
        'Array' => {
          name:    ['package_name'],
          valid:   [['testing'], ['test', 'ing']],
          invalid: ['invalid', 3, 2.42, { 'ha' => 'sh' }, true, false],
          message: 'expects an Array value',
        },
        'Boolean' => {
          name:    ['service_enable', 'enable_db_passwd', 'enable_db_group', 'enable_db_hosts', 'enable_db_services', 'enable_db_netgroup',
                    'enable_db_audit_user', 'enable_db_auth_attr', 'enable_db_bootparams', 'enable_db_ethers', 'enable_db_exec_attr',
                    'enable_db_ipnodes', 'enable_db_netmasks', 'enable_db_networks', 'enable_db_printers', 'enable_db_prof_attr',
                    'enable_db_project', 'enable_db_protocols', 'enable_db_rpc', 'enable_db_tnrhdb', 'enable_db_tnrhtp', 'enable_db_user_attr',
                    'enable_opt_auto_propagate'],
          valid:   [true, false],
          invalid: ['true', 'false', 'invalid', 3, 2.42, ['array'], { 'ha' => 'sh' }],
          message: 'expects a Boolean',
        },
        'Enum[present, installed, absen]' => {
          name:    ['package_ensure'],
          valid:   ['present', 'installed', 'absent'],
          invalid: ['invalid', 3, 2.42, ['array'], { 'ha' => 'sh' }, false],
          message: 'expects a match for Enum',
        },
        'Enum[yes, no]' => {
          name:    ['paranoia', 'passwd_enable_cache', 'passwd_check_files', 'passwd_persistent', 'passwd_shared', 'passwd_auto_propagate',
                    'group_enable_cache', 'group_check_files', 'group_persistent', 'group_shared', 'group_auto_propagate', 'hosts_enable_cache',
                    'hosts_check_files', 'hosts_persistent', 'hosts_shared', 'services_enable_cache', 'services_check_files', 'services_persistent',
                    'services_shared', 'netgroup_enable_cache', 'netgroup_check_files', 'netgroup_persistent', 'netgroup_shared',
                    'audit_user_enable_cache', 'audit_user_check_files', 'auth_attr_enable_cache', 'auth_attr_check_files',
                    'bootparams_enable_cache', 'bootparams_check_files', 'ethers_enable_cache', 'ethers_check_files', 'exec_attr_enable_cache',
                    'exec_attr_check_files', 'ipnodes_enable_cache', 'ipnodes_check_files', 'netmasks_enable_cache', 'netmasks_check_files',
                    'networks_enable_cache', 'networks_check_files', 'printers_enable_cache', 'printers_check_files', 'prof_attr_enable_cache',
                    'prof_attr_check_files', 'project_enable_cache', 'project_check_files', 'protocols_enable_cache', 'protocols_check_files',
                    'rpc_enable_cache', 'rpc_check_files', 'tnrhdb_enable_cache', 'tnrhdb_check_files', 'tnrhtp_enable_cache', 'tnrhtp_check_files',
                    'user_attr_enable_cache', 'user_attr_check_files'],
          valid:   ['yes', 'no'],
          invalid: ['invalid', 3, 2.42, ['array'], { 'ha' => 'sh' }, false],
          message: 'expects a match for Enum',
        },
        'Integer' => {
          name:    ['threads', 'max_threads', 'debug_level', 'restart_interval', 'passwd_positive_time_to_live', 'passwd_negative_time_to_live',
                    'passwd_keep_hot_count', 'passwd_suggested_size', 'passwd_max_db_size', 'group_positive_time_to_live',
                    'group_negative_time_to_live', 'group_keep_hot_count', 'group_suggested_size', 'group_max_db_size',
                    'hosts_positive_time_to_live', 'hosts_negative_time_to_live', 'hosts_keep_hot_count', 'hosts_suggested_size',
                    'hosts_max_db_size', 'services_positive_time_to_live', 'services_negative_time_to_live', 'services_keep_hot_count',
                    'services_suggested_size', 'services_max_db_size', 'netgroup_positive_time_to_live', 'netgroup_negative_time_to_live',
                    'netgroup_suggested_size', 'netgroup_max_db_size', 'audit_user_positive_time_to_live', 'audit_user_negative_time_to_live',
                    'audit_user_keep_hot_count', 'auth_attr_positive_time_to_live', 'auth_attr_negative_time_to_live', 'auth_attr_keep_hot_count',
                    'bootparams_positive_time_to_live', 'bootparams_negative_time_to_live', 'bootparams_keep_hot_count',
                    'ethers_positive_time_to_live', 'ethers_negative_time_to_live', 'ethers_keep_hot_count', 'exec_attr_positive_time_to_live',
                    'exec_attr_negative_time_to_live', 'exec_attr_keep_hot_count', 'ipnodes_positive_time_to_live', 'ipnodes_negative_time_to_live',
                    'ipnodes_keep_hot_count', 'netmasks_positive_time_to_live', 'netmasks_negative_time_to_live', 'netmasks_keep_hot_count',
                    'networks_positive_time_to_live', 'networks_negative_time_to_live', 'networks_keep_hot_count', 'printers_positive_time_to_live',
                    'printers_negative_time_to_live', 'prof_attr_positive_time_to_live', 'prof_attr_negative_time_to_live',
                    'prof_attr_keep_hot_count', 'project_positive_time_to_live', 'project_negative_time_to_live', 'project_keep_hot_count',
                    'protocols_positive_time_to_live', 'protocols_negative_time_to_live', 'protocols_keep_hot_count', 'rpc_positive_time_to_live',
                    'rpc_negative_time_to_live', 'rpc_keep_hot_count', 'tnrhdb_positive_time_to_live', 'tnrhdb_negative_time_to_live',
                    'tnrhdb_keep_hot_count', 'tnrhtp_positive_time_to_live', 'tnrhtp_negative_time_to_live', 'tnrhtp_keep_hot_count',
                    'user_attr_positive_time_to_live', 'user_attr_negative_time_to_live', 'user_attr_keep_hot_count'],
          valid:   [0, 242, 51_200_000 ],
          invalid: [2.42, 'string', ['array'], { 'ha' => 'sh' }, false],
          message: 'expects an Integer value',
        },
        'Optional[String[1]]' => {
          name:    ['service_provider', 'server_user'],
          valid:   ['systemd'],
          invalid: [['array'], { 'ha' => 'sh' }],
          message: 'expects a value of type Undef or String',
        },
        'Stdlib::Absolutepath & Optional[Stdlib::Absolutepath]' => {
          name:    ['package_source', 'package_adminfile', 'config_path', 'logfile'],
          valid:   ['/absolute/filepath', '/absolute/directory/'],
          invalid: ['relative/path', 3, 2.42, ['array'], { 'ha' => 'sh' }],
          message: 'expects a Stdlib::Absolutepath',
        },
        'Stdlib::Ensure::Service' => {
          name:    ['service_ensure'],
          valid:   ['running', 'stopped'],
          invalid: ['invalid', 3, 2.42, ['array'], { 'ha' => 'sh' }],
          message: 'Enum\[\'running\', \'stopped\'\]',
        },
        'Stdlib::Filemode' => {
          name:    ['config_mode'],
          valid:   ['0644', '0755', '0640', '0740'],
          invalid: [ 2770, '0844', '00644', 'string', ['array'], { 'ha' => 'sh' }, 3, 2.42, false],
          message: 'expects a match for Stdlib::Filemode',
        },
        'String[1]' => {
          name:    ['config_owner', 'config_group', 'service_name', 'stat_user'],
          valid:   ['string'],
          invalid: [false, 3, 2.42, ['array'], { 'ha' => 'sh' }],
          message: 'expects a String value',
        },
        'Variant[Integer, Enum[]]' => {
          name:    ['reload_count'],
          valid:   [0, 242, 51_200_000, 'unlimited'],
          invalid: [2.42, 'string', ['array'], { 'ha' => 'sh' }],
          message: 'value of type Integer or Enum',
        },
      }

      validations.sort.each do |type, var|
        var[:name].each do |var_name|
          mandatory_params = {} if mandatory_params.nil?
          var[:params] = {} if var[:params].nil?
          var[:valid].each do |valid|
            context "when #{var_name} (#{type}) is set to valid #{valid} (as #{valid.class})" do
              let(:params) { [mandatory_params, var[:params], { "#{var_name}": valid, }].reduce(:merge) }

              it { is_expected.to compile }
            end
          end

          var[:invalid].each do |invalid|
            context "when #{var_name} (#{type}) is set to invalid #{invalid} (as #{invalid.class})" do
              let(:params) { [mandatory_params, var[:params], { "#{var_name}": invalid, }].reduce(:merge) }

              it 'fail' do
                expect { is_expected.to contain_class(:subject) }.to raise_error(Puppet::Error, %r{#{var[:message]}})
              end
            end
          end
        end
      end # var[:name].each
    end # validations.sort.each
  end # describe 'variable type and content validations'
end
