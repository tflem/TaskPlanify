require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  def setup
    @user = User.new(name: "Patrick Star", email: "patrick@bb.com")
  end

  test "should be valid" do
    assert @user.valid?
  end

end