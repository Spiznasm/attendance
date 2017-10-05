class AttendanceRecord < ApplicationRecord
  belongs_to :student
  validates :date, :time_in, :time_out, :presence => true
  validate :end_time_after_start_time?

def end_time_after_start_time?
  if time_out <= time_in
    errors.add :time_out, "must be after start time"
  end
end
end
