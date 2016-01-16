require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "should have the necessary required validators" do
    customer = Customer.new
    assert_not customer.valid?
    assert_equal [:customer_name,:username,:email,:phone_number,:address, :gender], customer.errors.keys
  end

  test "should throw failure for undefined attribute" do
    customer = Customer.new
    assert_not customer.valid?
    assert_equal [:ibrahim_attr], customer.errors.keys
  end

end
