class AttendanceRecord < ApplicationRecord
  belongs_to :student
  validates :date, :time_in, :presence => true
  validate :end_time_after_start_time?

  def end_time_after_start_time?
    if time_out.blank?
      true
    elsif
      time_out <= time_in
      errors.add :time_out, "must be after start time"
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      all.each do |record|
        csv << [record.id.to_s, record.student.genesis_id.to_s, nil, record.date.strftime("%Y-%m-%d"), record.time_in ? record.time_in.strftime("%H:%M:00.000") : nil, record.time_out ? record.time_out.strftime("%H:%M:00.000") : nil, record.break ? record.break.to_s : 0, 'R',nil,nil, 'Y']
      end
    end
  end
end

