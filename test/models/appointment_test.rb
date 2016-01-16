require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase

  test "should have the necessary required validators" do
    appointment = Appointment.new
    assert_not appointment.valid?
    assert_equal [:customer_name,:technician_name,:phone_number,:appointment_type,:address,:product_model,:appointment_date], appointment.errors.keys
  end

  test "should error undefined attribute" do
    appointment = Appointment.new
    assert_not appointment.valid?
    assert_equal [:ibrahim_attr], appointment.errors.keys
  end

end
