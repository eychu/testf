module Testf
  class Reporter
    def initialize(tests, success, fail)
      @report = "Tests count: #{tests} \n" <<
                "Asserts succeded: #{success} \n" <<
                "Asserts failed: #{fail} \n"
    end

    def show_report
      puts @report
    end
  end
end