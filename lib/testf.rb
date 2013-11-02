require 'active_support/descendants_tracker'
require 'active_support/dependencies/autoload'

module Testf
  autoload :BaseTest, 'testf/base_test'
  at_exit {BaseTest.descendants.each{ |klass| klass.run }}
end
