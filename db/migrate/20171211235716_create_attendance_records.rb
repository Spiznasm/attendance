class CreateAttendanceRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :attendance_records do |t|
      t.datetime :date
      t.datetime :time_in
      t.datetime :time_out
      t.integer :break
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
