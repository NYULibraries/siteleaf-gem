require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'

desc 'Checking Bundler setup'
begin
  Bundler.setup
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
  puts 'Run `bundle install` to install missing gems'
end

desc 'Run Rspec'
begin
  RSpec::Core::RakeTask.new(:spec)
  task default: :spec
rescue LoadError
  puts 'No Rspec available'
end

desc 'Run RuboCop'
begin
  RuboCop::RakeTask.new(:rubocop)
  task default: :rubocop
rescue LoadError
  puts 'No Rubocop available'
end

task :install do
  puts 'bundle exec rake install'
end

desc 'Run Rake Install to update gem'
begin
  task default: :install
rescue LoadError
  puts 'Could not create gem'
end
