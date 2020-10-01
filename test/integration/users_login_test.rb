require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end
  test "login with invalid information" do
    # GET PAGE
    get login_path
    assert_template 'sessions/new'
    
    # try wrong login
    post login_path, params: { session: { email: "", password: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty? # need flash
      
    # go another page
    get root_path
    assert flash.empty? # needless flash
  end

  test "login with valid information" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'password' } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
      # login_pathがなくなっているか
    assert_select "a[href=?]", logout_path
      # logout_pathがあるか
    assert_select "a[href=?]", user_path(@user)
  end
end
