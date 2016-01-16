require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "should have the necessary required validators" do
    product = Product.new
    assert_not product.valid?
    assert_equal [:product_name, :description, :product_model, :serial_number, :price, :stock, :asset], product.errors.keys
  end

  test "should throw failure for undefined attribute" do
    product = Product.new
    assert_not product.valid?
    assert_equal [:ibrahim_attr], product.errors.keys
  end

end
