class AttendanceRecordsController < ApplicationController
  def create

  end

private

  def attendance_record_params
    params.require(:attendance_record).permit(:date, :time_in, :time_out, :break, :student_id)
  end

end
