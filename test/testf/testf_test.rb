require 'test_helper'

class SampleTest < Testf::BaseTest
  setup do
    @setup = true
  end

  testf 'assert true test' do
    assert true
    assert false
  end

  testf 'setup work' do
    assert @setup
  end
end
