require 'test_helper'

class SongsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get upload:post" do
    get :upload:post
    assert_response :success
  end

  test "should get delete:delete" do
    get :delete:delete
    assert_response :success
  end

end
