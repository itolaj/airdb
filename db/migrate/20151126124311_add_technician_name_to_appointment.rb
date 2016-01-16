class AddTechnicianNameToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :technician_name, :string
  end
end
