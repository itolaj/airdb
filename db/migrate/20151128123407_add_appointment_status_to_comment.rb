class AddAppointmentStatusToComment < ActiveRecord::Migration
  def change
    add_column :comments, :status, :string
  end
end
