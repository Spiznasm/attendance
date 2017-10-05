json.extract! attendance_record, :id, :genesis_id, :date, :time_in, :time_out, :break, :student_id, :created_at, :updated_at
json.url attendance_record_url(attendance_record, format: :json)
