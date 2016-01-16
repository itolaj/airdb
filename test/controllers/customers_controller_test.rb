require 'test_helper'
include Devise::TestHelpers

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    sign_in User.first
    xhr :get, :new, format: :js
    assert_response :success
  end

  test "should create customer" do
    sign_in User.first
    assert_difference('Customer.count') do
      xhr :post, :create, format: :js, customer: { address: @customer.address, customer_name: @customer.customer_name, email: @customer.email, gender: @customer.gender, password: @customer.password, phone_number: @customer.phone_number, registration_date: @customer.registration_date, username: @customer.username }
    end

  end

  test "should show customer" do
    sign_in User.first
    xhr :get, :show, format: :js, id: @customer
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    xhr :get, :edit, format: :js, id: @customer
    assert_response :success
  end

  test "should update customer" do
    sign_in User.first
    xhr :patch, :update, format: :js, id: @customer, customer: { address: @customer.address, customer_name: @customer.customer_name, email: @customer.email, gender: @customer.gender, password: @customer.password, phone_number: @customer.phone_number, registration_date: @customer.registration_date, username: @customer.username }
  end

  test "should destroy customer" do
    sign_in User.first
    assert_difference('Customer.count', -1) do
      delete :destroy, format: :js, id: @customer
    end

  end
end
