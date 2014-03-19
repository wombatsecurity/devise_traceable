# encoding: UTF-8
require 'rake'
require 'rake/testtask'
require File.join(File.dirname(__FILE__), 'lib', 'devise_traceable', 'version')

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :default => :test
