require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "page title helper" do
    assert_equal "Book Caffe", page_title
    assert_equal "Home | Book Caffe", page_title("Home")
  end
end