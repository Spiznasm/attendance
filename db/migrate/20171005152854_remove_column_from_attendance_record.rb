class RemoveColumnFromAttendanceRecord < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendance_records, :genesis_id, :string
  end
end
