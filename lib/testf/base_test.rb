module Testf
  class BaseTest
    extend ActiveSupport::DescendantsTracker

    class << self

      def autorun
        at_exit {BaseTest.descendants.each{ |klass| klass.run }}
      end

      def setup(&block)
        @testf_setup = block
      end

      def teardown(&block)
        @testf_teardown = block
      end

      def testf(test_name, &block)
        @tests_set ||= {}
        @tests_set[test_name.to_sym] = block
      end

      def run
        @resulter = Resulter.new

        @tests_set.each do |test_name, block|
          @testf_setup.try :call
          puts "[#{test_name}]".colorize(:yellow)
          block.call
          puts
          @testf_teardown.try :call
        end

        rep = Reporter.new @tests_set.count,
                           @resulter.success_count,
                           @resulter.fail_count
        rep.show_report
      end

      def assert(expression)
        if !!expression
          @resulter.increment_success
          print ".".colorize(:green)
        else
          @resulter.increment_fail
          print "F".colorize(:red)
        end
      end
    end
  end
end