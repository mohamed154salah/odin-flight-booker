require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get passengers" do
    get bookings_passengers_url
    assert_response :success
  end
end
