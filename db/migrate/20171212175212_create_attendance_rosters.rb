class CreateAttendanceRosters < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_rosters do |t|
      t.datetime :date
      t.references :location

      t.timestamps
    end
  end
end
