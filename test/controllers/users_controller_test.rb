require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: 'Vanessa', email: 'vanessa@love.com', password: 'lovelovers', password_confirmation: 'lovelovers')
    @other_user = User.create(username: 'Lovers', email: 'lovers@love.com', password: 'lovelove', password_confirmation: 'lovelove')
  end

  def teardown
    @user = nil
    @other_user = nil
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should redirect edit when not logged in" do
    get edit_user_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect update when not logged in" do
    patch user_path(@user), params: {user: { username: @user.username, email: @user.email }}
    assert_not flash.empty?
    assert_redirected_to login_url
  end

end
