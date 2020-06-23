require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @other_user = users(:archer)
  end

  test "should get root" do
    log_in_as(@user)
    get root_url
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
  end

end
