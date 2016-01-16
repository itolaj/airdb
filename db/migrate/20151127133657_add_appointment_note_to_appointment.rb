class AddAppointmentNoteToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_note, :text
  end
end
