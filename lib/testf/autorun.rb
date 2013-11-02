begin
  require 'rubygems'
  gem 'testf'
rescue Gem::LoadError
  # do nothing
end

require 'testf'

Testf::BaseTest.autorun