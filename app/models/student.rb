class Student < ApplicationRecord
  has_many :attendance_records
  validates :name, presence: true
  validates :genesis_id, presence: true
end
