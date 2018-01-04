class AttendanceRostersController < ApplicationController
  def roll_call
    @empty_attendances = []

    Student.all.each do |student|
      @empty_attendances << student.attendance_records.build
    end
  end
    
end
