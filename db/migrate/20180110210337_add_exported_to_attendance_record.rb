class AddExportedToAttendanceRecord < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_records, :exported, :boolean
  end
end
