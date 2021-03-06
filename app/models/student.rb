class Student < ApplicationRecord
  has_many :attendance_records
  validates :name, presence: true
  validates :genesis_id, presence: true
  accepts_nested_attributes_for :attendance_records
end
