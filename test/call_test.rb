# Checkpoint 01-introductions - Assignment:
  #Add tests to Blocworks

  #Use rack-test and test-unit
  #Write tests for call

# in your terminal you can run this file using the following command:
  # bundle exec ruby test/call_test.rb

=begin
  Results:
  Loaded suite test/call_test
  Started
  .

  Finished in 0.039924037 seconds.
  --------------------------------------------------------------------------------------
  1 tests, 3 assertions, 0 failures, 0 errors, 0 pendings, 0 omissions, 0 notifications
  100% passed
  --------------------------------------------------------------------------------------
  25.05 tests/s, 75.14 assertions/s
=end

require "bloc_works"
require "test/unit"
require "rack/test"

# write tests for call method in Blocworks application
class CallTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocWorks::Application.new
  end

  def test_call_method
    get '/'
    assert last_response.ok?
    assert last_response.header.has_value?("text/html")
    assert_equal last_response.body, 'Hello Blocheads!'
  end
end
