class SessionsController < ApplicationController
  include MessageHelper

  def new
  end

  def create
    if authenticated_registered_user?
      session[:user_id] = registered_user_credential.id
      flash_message_successful_login
      redirect_to root_path
    else
      flash.now[:danger] = "Name and password combination not found, please try again"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success] = "Successfully logged out"
    redirect_to login_path
  end

  private
    def registered_user_credential
      User.find_by(email: params[:email])
    end

     def authenticated_registered_user?
      registered_user_credential && registered_user_credential.authenticate(params[:password])
    end

end