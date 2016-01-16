require 'test_helper'
include Devise::TestHelpers

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    sign_in User.first
    xhr :get, :new, format: :js
    assert_response :success
  end

  test "should create product" do
    sign_in User.first
    assert_difference('Product.count') do
      xhr :post, :create, format: :js, product: { image: @product.image, price: @product.price, product_model: @product.product_model, product_name: @product.product_name, serial_number: @product.serial_number, stock: @product.stock }
    end
  end

  test "should show product" do
    sign_in User.first
    xhr :get, :show, format: :js, id: @product
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    xhr :get, :edit, format: :js, id: @product
    assert_response :success
  end

  test "should update product" do
    sign_in User.first
    xhr :patch, :update, format: :js, id: @product, product: { image: @product.image, price: @product.price, product_model: @product.product_model, product_name: @product.product_name, serial_number: @product.serial_number, stock: @product.stock }

  end

  test "should destroy product" do
    sign_in User.first
    assert_difference('Product.count', -1) do
      delete :destroy, format: :js, id: @product
    end
  end
end
