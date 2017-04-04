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
    @link = Link.create(link_params)
    if @link.valid_url?(params[:url])
      @link.save
      flash[:success] = "Link created"
    else
      flash[:error] = "Invalid Link URL, please being the link path with http://www."
      render :index
    end
  end

  def edit
  end

  def update
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
