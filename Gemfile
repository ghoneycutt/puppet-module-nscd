source ENV['GEM_SOURCE'] || 'https://rubygems.org'

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end

gem 'metadata-json-lint'
gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'puppet-lint', '>= 1.0.0'
gem 'facter', '>= 1.7.0'
gem 'rspec-puppet'

gem 'rspec',     '~> 2.0'   if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
gem 'rake',      '~> 10.0'  if RUBY_VERSION >= '1.8.7' and RUBY_VERSION < '1.9'
gem 'json',      '<= 1.8'   if RUBY_VERSION < '2.0.0'
gem 'json_pure', '<= 2.0.1' if RUBY_VERSION < '2.0.0'
gem 'rubocop'               if RUBY_VERSION >= '1.9'
