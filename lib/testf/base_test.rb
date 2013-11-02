module Testf
  class BaseTest
    extend ActiveSupport::DescendantsTracker

    class << self
      attr_reader :tests_set
      attr_reader :test_results
      attr_reader :setup

      def setup(&block)
        @setup = block
      end

      def testf(test_name, &block)
        @tests_set ||= {}
        @tests_set[test_name.to_sym] = block
      end

      def run
        @tests_set.each do |test_name, block|
          puts test_name
          @setup.call if @setup
          block.call
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