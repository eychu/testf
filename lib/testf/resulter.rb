module Testf
  class Resulter
    attr_reader :success_count,
                :fail_count

    def initialize
      @success_count = 0
      @fail_count = 0
    end

    def increment_success
      @success_count += 1
    end

    def increment_fail
      @fail_count += 1
    end
  end
end