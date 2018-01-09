class AttendanceSearch
  attr_accessor :search_date
  
  def initialize(params)
    params ||= {}
    @search_date = parsed_date(params[:search_date], Date.today)
  end
  
  private
  def parsed_date(date_string, default)
    Date.parse(date_string)
  rescue ArgumentError, TypeError
    default
  end
  
end