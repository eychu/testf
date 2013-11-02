module Testf
  class BaseTest
    extend ActiveSupport::DescendantsTracker

    class << self
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
        @tests_set.each do |test_name, block|
          puts test_name
          @testf_setup.try :call
          block.call
          @testf_teardown.try :call
        end

        @test_results.each do |result|
          print result ? '.' : 'F'
        end
        puts

      end

      def assert(expression)
        @test_results ||= []
        @test_results << !!expression
      end

    end

  end
end