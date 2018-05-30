require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar")
  end

  test "should be valid" do
    assert @user.valid?
  end

test 'name should be present' do
  @user.name = " "
  assert_not @user.valid?
end

test 'email should be present' do
  @user.email = "  "
  assert_not @user.valid?
  # jeżeli asercaja zwróci false to test przejdzie
end

test "name should not be to long" do
  @user.name = "a" * 51
  assert_not @user.valid?
end

test "email should not be to long" do
  @user.email = "a" * 244 + "@example"
  assert_not @user.valid?
end

test "email validation should accept valid addresses" do
  valid_addresses = %w[user@example.com USER@foo.COM, A_US_ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
  valid_addresses.each do |   valid_address|
    @user.email = valid_address
    assert @user.valid?, "#{valid_address.inspect} should be valid"
  end
end

test "email must be unique" do
  duplicate_user = @user.dup
  duplicate_user.email = @user.email.upcase
  @user.save
  assert_not duplicate_user.valid?
end


test "email addresses should be saved as lower-case" do
  mixed_case_email = "foo@ExamPle.cOm"
  @user.email = mixed_case_email
  @user.save
  assert_equal mixed_case_email.downcase, @user.reload.email
end

test "password should be present (nonblank)" do
  @user.password = "   " * 6
  assert_not @user.valid?
end

test "password should have minimum length" do
  @user.password = "a" * 5
  assert_not @user.valid?
end

 test "authenticated? should return false for a user with nil digest" do
   assert_not @user.authenticated?(:remember, '')
 end

 test "associated micropost should be destroyed" do
   @user.save
   @user.microposts.create!(content: "Lorem ipsum")
   assert_difference 'Micropost.count', -1 do
     @user.destroy
   end
 end

end
