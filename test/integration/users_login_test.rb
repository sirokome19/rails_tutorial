require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
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
end
