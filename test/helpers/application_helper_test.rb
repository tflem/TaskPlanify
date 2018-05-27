require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

    test "full title helper" do
      assert_equal full_title, "Task Planify"
      assert_equal full_title("Home"), "Home | Task Planify"
    end
end