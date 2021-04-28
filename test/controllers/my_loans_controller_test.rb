require "test_helper"

class MyLoansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_loans_index_url
    assert_response :success
  end

  test "should get show" do
    get my_loans_show_url
    assert_response :success
  end
end
