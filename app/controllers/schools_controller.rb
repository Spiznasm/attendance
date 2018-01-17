class SchoolsController < ApplicationController
  before_action :admin_user
  before_action :logged_in_user

  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = "New School Created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @school = School.find(params[:id])
  end

  def edit
    @school = School.find(params[:id])
  end

  def update
    @school = School.find(params[:id])
    if @school.update_attributes(school_params)
      flash[:success] = "School updated"
      redirect_to @school
    else
      render 'edit'
    end
  end

  def index
    @schools = School.all
  end

  def destroy
    School.find(params[:id]).destroy
    flash[:success] = "School deleted"
    redirect_to schools_url
  end

  private

    def school_params
      params.require(:school).permit(:name)
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end



end
