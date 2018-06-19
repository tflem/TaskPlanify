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

  test "valid signup information" do
    get signup_path
    assert_difference "User.count", 1 do
      post users_path, params: { user: { name:  "Patrick",
                                         email: "patrick@bb.com",
                                         password:              "12345678",
                                         password_confirmation: "12345678" } }
      
    end
    follow_redirect!
    assert_template "users/show"
    assert_not flash.empty?
    assert is_signed_in?
  end
end