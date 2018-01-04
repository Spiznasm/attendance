class Student < ApplicationRecord
  has_many :attendance_rosters, foreign_key: "student_id"
  has_many :attendance_records

  def display_name
    "#{self.last_name}, #{self.first_name}"
  end
end
