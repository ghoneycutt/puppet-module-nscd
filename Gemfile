source 'https://rubygems.org'

puppetversion = ENV['PUPPET_VERSION']

unless puppetversion.nil?
    gem 'puppet', puppetversion, :require => false
else
    gem 'puppet', :require => false
end

gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'puppet-lint', '>= 1.0.0'
gem 'facter', '>= 1.7.0'
gem 'rspec', '~>2.0'
gem 'rspec-puppet', '~>1.0'
