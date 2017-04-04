class SessionsController < ApplicationController
  include MessageHelper

  def new
  end

  def create
    if registered_user_credential
      session[:user_id] = registered_user_credential.id
      flash_message_successful_login
      redirect_to root_path
    else
      flash_message_failed_login
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash_message_successful_logout
    redirect_to login_path
  end

  private
    def registered_user_credential
      User.find_by(email: params[:email])
    end

end