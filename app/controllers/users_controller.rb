class UsersController < ApplicationController
  include MessageHelper

  def new
    @user = User.new
  end

  def create
    @registered_user = User.create(user_params)

    if @registered_user.save
      session[:user_id] = @registered_user.id
      flash_message_successful_account_creation
      redirect_to root_path
    else
      @registered_user.destroy
      @errors = @registered_user.errors
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end