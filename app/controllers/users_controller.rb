class UsersController < ApplicationController
  include MessageHelper

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash_message_successful_account_creation
      redirect_to root_path
    else
      @user.destroy
      flash_message_failed_registration
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end