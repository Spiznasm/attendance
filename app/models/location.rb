class Location < ApplicationRecord
  has_many :students
  has_many :attendance_rosters
end
