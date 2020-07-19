require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:vanessa)
  end

  test "unsuccessful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: {user: {username: '', email:'invalid@invalid', password: 'inv', password_confirmation: 'val'}}

    assert_template 'users/edit'
  end

  test "successful edit" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = 'love lovers'
    email = 'love@lovers.com'
    patch user_path(@user), params: {user: {username: name, email: email, password: '', password_confirmation: ''}}

    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal name, @user.username
    assert_equal email, @user.email
  end
end
