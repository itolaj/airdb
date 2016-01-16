require 'test_helper'

class PurchaseTest < ActiveSupport::TestCase

  test "should have the necessary required validators" do
    purchase = Purchase.new
    assert_not purchase.valid?
    assert_equal [:customer_name, :product_name, :product_model, :price, :purchase_date, :maintnance_date], purchase.errors.keys
  end

  test "should throw failure for undefined attribute" do
    purchase = Purchase.new
    assert_not purchase.valid?
    assert_equal [:ibrahim_attr], purchase.errors.keys
  end

end
