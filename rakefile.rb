require 'rubygems'
require 'cucumber/rake/task'
require 'rspec/core/rake_task'

desc 'default: run cucumber and specs'
task :default=>[:cucumber,:spec]

desc 'run cucumber'
Cucumber::Rake::Task.new(:cucumber) do |task|
  task.cucumber_opts = ["features"]
end

desc 'run specs'
RSpec::Core::RakeTask.new do|t|
  t.pattern = "*_spec.rb"
end