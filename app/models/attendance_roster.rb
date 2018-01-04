class AttendanceRoster < ApplicationRecord
  has_many :students
  has_many :attendance_records
end
