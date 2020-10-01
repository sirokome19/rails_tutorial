require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
  end

  test "should be valid" do
    assert @user.valid?
  end
  test "name should be present" do
    # name can't be blank
    @user.name = "     "
    assert_not @user.valid?
  end
  test "email should be present" do
    # email can't be blank
    @user.email = "     "
    assert_not @user.valid?
  end
end
