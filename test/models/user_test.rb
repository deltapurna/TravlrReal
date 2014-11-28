require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.new(name: 'fulan', email: 'fulan@gmail.com')
  end

  test "valid if all filled" do
    assert @user.valid?
  end

  test "invalid if no name" do
    @user.name = '          '
    assert @user.invalid?
  end

  test "invalid if name bigger than 50 character" do
    @user.name = 'a'*51
    assert @user.invalid?
    assert_equal true, @user.invalid?
  end

  test "invalid if no email" do
    @user.email = '          '
    assert @user.invalid?
  end

  test "invalid if email already exist" do
    User.create(name: 'delta', email: 'd@qiscus.com')
    @user.email = 'd@qiscus.com'
    assert @user.invalid?
  end

  test "valid if email format is valid" do
    @user.email = 'd@qiscus.com'
    assert @user.valid?
  end

  test "invalid if email format is invalid" do
    @user.email = 'd@qiscus'
    assert @user.invalid?
  end
end
