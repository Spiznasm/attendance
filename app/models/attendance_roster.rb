class AttendanceRoster < ApplicationRecord
  has_many :attendance_records
  belongs_to :location
end
