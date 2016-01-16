class AddAppointmentStatusToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_status, :string
  end
end
