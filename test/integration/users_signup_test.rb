require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest

  test "invalid sign_up user information" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, params: { user: { name: "", email: "", password: "foo", password_confirmation: "bar"}}
    end
    assert_template 'users/new'
    assert_select 'div#error_explenation'
    assert_select 'div.alert.alert-danger'
  end


end