require 'test_helper'
include Devise::TestHelpers

class AppointmentsControllerTest < ActionController::TestCase
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    sign_in User.first
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test "should get new" do
    sign_in User.first
    xhr :get, :new, format: :js
    assert_response :success
  end

  test "should create appointment" do
    sign_in User.first
    assert_difference('Appointment.count') do
      post :create, appointment: { customer_name: @appointment.customer_name, appointment_note: @appointment.appointment_note, technician_name: @appointment.technician_name, phone_number: @appointment.phone_number, appointment_type:  @appointment.appointment_type, address: @appointment.address, product_model:  @appointment.product_model, appointment_date:  @appointment.appointment_date, status:  @appointment.status }

    end
  end

  test "should show appointment" do
    sign_in User.first
    xhr :get, :show, format: :js, id: @appointment
    assert_response :success
  end

  test "should get edit" do
    sign_in User.first
    xhr :get, :edit, format: :js,  id: @appointment
    assert_response :success
  end

  test "should update appointment" do
    sign_in User.first
    patch :update, id: @appointment, appointment: { customer_name: @appointment.customer_name, appointment_note: @appointment.appointment_note, technician_name: @appointment.technician_name, phone_number: @appointment.phone_number, appointment_type:  @appointment.appointment_type, address: @appointment.address, product_model:  @appointment.product_model, appointment_date:  @appointment.appointment_date, status:  @appointment.status }
  end

  test "should destroy appointment" do
    sign_in User.first
    assert_difference('Appointment.count', -1) do
      delete :destroy, format: :js, id: @appointment
    end
  end
end
