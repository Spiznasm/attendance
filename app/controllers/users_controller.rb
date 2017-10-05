class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if User.count >= 2
      flash[:notice] = "The maximum number of users has been reached"
      redirect_to root_url
    else
      @user = User.new(user_params)
      if @user.save
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to root_url
      else
        render 'new'
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


end
