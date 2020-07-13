require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
   test "layout links" do
      get root_path
      assert_template 'static_pages/home'
      assert_select "a[href=?]", root_path
      assert_select "a[href=?]", home_path

      get signup_path
      assert_select "title", page_title("Sign up")
      
   end
end
