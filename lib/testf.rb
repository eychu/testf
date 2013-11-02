require 'active_support/descendants_tracker'
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/object/try'

module Testf
  autoload :BaseTest, 'testf/base_test'
  at_exit {BaseTest.descendants.each{ |klass| klass.run }}
end
