require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(username: "Test", email: "user@example.com",
                     password: "learncode", password_confirmation: "learncode")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "username should not be blank" do
    @user.username = "     "
    assert_not @user.valid?
  end

  test "username should not be less than 4 characters" do
    @user.username = "lov"
    assert_not @user.valid?
  end

  test "email should not be blank" do
    @user.email = "     "
    assert_not @user.valid?
  end

  test "email should not be greater than 250 characters" do
    @user.email = "lov@me.org" * 100
    assert_not @user.valid?
  end

  test "email should be a correct format" do
    valid_emails = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_emails.each do |valid_email|
      @user.email = valid_email
      assert @user.valid?, "#{valid_email.inspect} should be valid"
    end
  end

  test "validation should reject invalid emails" do
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?, "#{invalid_email.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = "     "
    assert_not @user.valid?
  end

  test "password should be at least 8 characters long" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
