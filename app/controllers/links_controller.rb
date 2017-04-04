class LinksController < ApplicationController
  include MessageHelper

  before_action :require_login

  def index
    if current_user 
      @user = User.find(current_user.id)
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
    if current_user == @user
      @link = Link.find(params[:id])
    else
      redirect_to :status => 404
    end
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(link_params)
      @link.save
      flash.now[:success] = "Link successfully edited"
      redirect_to root_path
    else
      flash.now[:danger] = "Error in update, please try again. URL must be valid and title must be present."
      @errors = @link.errors
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :url)
    end

end
