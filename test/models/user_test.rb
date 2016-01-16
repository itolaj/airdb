require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "should have the necessary required validators" do
    user = User.new
    assert_not user.valid?
    assert_equal [:name, :registration_date, :expiration_date, :personal_number, :phone_number, :email, :password, :password_confirmation, :address, :user_role], user.errors.keys
  end

  test "should throw failure for undefined attribute" do
    user = User.new
    assert_not user.valid?
    assert_equal [:ibrahim_attr], user.errors.keys
  end

end
