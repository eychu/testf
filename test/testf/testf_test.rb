require 'test_helper'

class SampleTest < Testf::BaseTest
  setup do
    puts "start"
  end

  teardown do
    puts "end"
  end

  testf 'assert_true_test' do
    assert true
  end

end
