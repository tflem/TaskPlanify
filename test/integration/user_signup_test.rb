require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest

  test "invalid signup information" do
    get signup_path
    assert_select 'form[action="/signup"]'
    assert_no_difference "User.count" do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "boo",
                                         password_confirmation: "hoo" } }
      end
      assert_template "users/new"
      assert_select "div#error_explanation"
      assert_select "div.field_with_errors"
  end
end