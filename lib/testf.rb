require 'active_support/descendants_tracker'
require 'active_support/dependencies/autoload'
require 'active_support/core_ext/object/try'
require 'colorize'

module Testf
  autoload :BaseTest, 'testf/base_test'
  autoload :Reporter, 'testf/reporter'
  autoload :Resulter, 'testf/resulter'

  # TODO вынести в отдельный метод
  at_exit {BaseTest.descendants.each{ |klass| klass.run }}
end
