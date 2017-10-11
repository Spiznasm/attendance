module AttendanceRecordsHelper
  
  def hour_calc(record)
    if record.time_out.blank?
      0
    else
      ((record.time_out - record.time_in)/60 - (record.break.nil? ? 0 : record.break))/60*10.to_i / 10
    end
  end
  
  def record_select_dates(date1, date2)
    selected = []
    AttendanceRecord.all.each do |record|
      if record.date >= date1 && record.date <= date2
        selected.push(record)
      end
    end
    return selected
  end
  
end
