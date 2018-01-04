class CreateAttendanceRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_rosters do |t|
      t.references :attendance_record
      t.references :student
      
      t.timestamps
    end
  end
end
