require 'test_helper'

class StaticPageControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Task Planify"
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end
end
