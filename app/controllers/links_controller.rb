class LinksController < ApplicationController
  include MessageHelper

  before_action :require_login

  def index
    if current_user 
      user = User.find(current_user.id)
      @links = Link.all
    else
      flash_message_please_login
      redirect_to login_path
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

end
