require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    get signup_path
    
    assert_no_difference 'User.count' do
      post users_path, params: {user: {username: "", email: "user@invalid", password: "short", password_confirmation: "invalid"}}
    end
    assert_template 'users/new'
  end

  test "valid signup information" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: {user: { username:  "Example User",
                                            email: "user@example.com",
                                            password: "password",
                                            password_confirmation: "password" }}
                                          
      follow_redirect!                                     
    end
    assert_template 'users/show'
  end
end
