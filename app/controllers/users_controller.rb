class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user
  

  def new
    @user = User.new
    @schools = School.all
  end

  def create
    @user = User.new(user_params)
    @schools = School.all
    if @user.save
      log_in @user
      flash[:success] = "New User Created"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @schools = School.all
  end

  def update
    @user = User.find(params[:id])
    @schools = School.all
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.all
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, {school_ids: []})
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end


end
