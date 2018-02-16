class AttendanceRecordsController < ApplicationController
  before_action :logged_in_user
  before_action :set_attendance_record, only: [:show, :edit, :update, :destroy]
  before_action :set_date
  

  # GET /attendance_records
  # GET /attendance_records.json
  def index
    @attendance_records = AttendanceRecord.all
  end

  # GET /attendance_records/1
  # GET /attendance_records/1.json
  def show
  end

  # GET /attendance_records/new
  def new
    @attendance_record = AttendanceRecord.new
  end

  # GET /attendance_records/1/edit
  def edit
  end

  # POST /attendance_records
  # POST /attendance_records.json
  def create
    @attendance_record = AttendanceRecord.new(attendance_record_params)
    respond_to do |format|
      if @attendance_record.save
        format.html { redirect_to roll_call_path(roll_call_date: pass_date(@attendance_record.date) }
        flash[:notice] = "Attendance Record Saved."
        format.json { render :show, status: :created, location: @attendance_record }
      else
        format.html { render :new }
        format.json { render json: @attendance_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attendance_records/1
  # PATCH/PUT /attendance_records/1.json
  def update
    respond_to do |format|
      if @attendance_record.update(attendance_record_params)
        format.html { redirect_to roll_call_path(roll_call_date: pass_date(@attendance_record.date), notice: 'Attendance record was successfully updated.' }
        format.json { render :show, status: :ok, location: @attendance_record }
      else
        format.html { redirect_to roll_call_path(roll_call_date: pass_date(@attendance_record.date)), notice: 'Invalid submission' }
        format.json { render json: @attendance_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendance_records/1
  # DELETE /attendance_records/1.json
  def destroy
    @attendance_record.destroy
    respond_to do |format|
      format.html { redirect_to request.referrer, notice: 'Attendance record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def roll_call
    @students = current_user.students.order(:name)
    @record = AttendanceRecord.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_record
      @attendance_record = AttendanceRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attendance_record_params
      params.require(:attendance_record).permit(:genesis_id, :date, :time_in, :time_out, :break, :student_id)
    end

    def set_date
      if params[:roll_call_date]
        @date = Date.new(params[:roll_call_date]["date(1i)"].to_i, params[:roll_call_date]["date(2i)"].to_i, params[:roll_call_date]["date(3i)"].to_i)
      else
        @date = Date.today
      end
    end

    
    def pass_date(date)
      {"date(1i)" => date.year.to_s, "date(2i)" => date.month.to_s, "date(3i)" => date.day.to_s}
    end
end
