require 'test_helper'

class AutocompleteControllerTest < ActionController::TestCase
  test "should get user_json" do
    get :user_json
    assert_response :success
  end

end
