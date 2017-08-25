require "bloc_works"
require "test/unit"
require "rack/test"


# write tests for Routing
# in your terminal you can run this file using the following command:
  # bundle exec ruby test/routing_tests.rb

class RoutingTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    BlocWorks::Application.new
  end

  def test_it_errors_out_when_there_is_no_file
    get '/'
    assert last_response != true
    assert_equal "404 ERROR. That path does not exist.", last_response.body
    assert last_response.header.has_value?("text/html")
  end
end
