require 'test_helper'
include Devise::TestHelpers

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    sign_in User.first
    xhr :get, :new, format: :js
    assert_response :success
  end

  test "should create user" do
    sign_in User.first
    assert_difference('User.count') do
      xhr :post, :create, format: :js, user: { address: @user.address, email: @user.email, expiration_date: @user.expiration_date, name: @user.name, personal_number: @user.personal_number, phone_number: @user.phone_number, registration_date: @user.registration_date, user_role: @user.user_role }
    end
  end

  test "should show user" do
    sign_in User.first
    xhr :get, :show, format: :js, id: @user
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    xhr :get, :edit, format: :js, id: @user
    assert_response :success
  end

  test "should update user" do
    sign_in User.first
    xhr :patch, :update, format: :js, id: @user, user: { address: @user.address, email: @user.email, expiration_date: @user.expiration_date, name: @user.name, personal_number: @user.personal_number, phone_number: @user.phone_number, registration_date: @user.registration_date, user_role: @user.user_role }

  end

  test "should destroy user" do
    sign_in User.first
    assert_difference('User.count', -1) do
      delete :destroy, format: :js, id: @user
    end
  end
end
