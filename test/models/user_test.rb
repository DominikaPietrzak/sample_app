require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com")
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

test "email should be downcase" do
  emails = %w[email@email.com EMAIL@Email.com]
  emails_down = %w[email@email.com email@email.com]
  emails.each do |mail|
    emails_down.each do |mail_down|
      @user.email = mail.downcase
      @user.save
      assert_equal(mail_down, @user.email)
    end
  end
end

end
