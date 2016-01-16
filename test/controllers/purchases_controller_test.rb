require 'test_helper'
include Devise::TestHelpers

class PurchasesControllerTest < ActionController::TestCase
  setup do
    @purchase = purchases(:one)
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:purchases)
  end

  test "should get new" do
    sign_in User.first
    xhr :get, :new, format: :js
    assert_response :success
  end

  test "should create purchase" do
    sign_in User.first
    assert_difference('Purchase.count') do
      xhr :post, :create, format: :js, purchase: { customer_name: @purchase.customer_name, maintnance_date: @purchase.maintnance_date, price: @purchase.price, product_model: @purchase.product_model, product_name: @purchase.product_name, purchase_date: @purchase.purchase_date }
    end
  end

  test "should show purchase" do
    sign_in User.first
    xhr :get, :show, format: :js, id: @purchase
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    xhr :get, :edit, format: :js, id: @purchase
    assert_response :success
  end

  test "should update purchase" do
    sign_in User.first
    xhr :patch, :update, format: :js, id: @purchase, purchase: { customer_name: @purchase.customer_name, maintnance_date: @purchase.maintnance_date, price: @purchase.price, product_model: @purchase.product_model, product_name: @purchase.product_name, purchase_date: @purchase.purchase_date }
  end

  test "should destroy purchase" do
    sign_in User.first
    assert_difference('Purchase.count', -1) do
      delete :destroy, format: :js, id: @purchase
    end
  end
end
