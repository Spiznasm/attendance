class StudentsController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @students = Student.all
  end

  def roll_call
    @students = Student.find(params[:student_ids])
    @records = []
    @students.each do |student|
      @records << student.attendance_records.create!
    end
  end

  def roll_call_update
    @records = AttendanceRecord.update(params[:records].keys, params[:records].values)
    flash[:notice] = "Attendance Submitted"
    redirect_to students_path
  end
end
