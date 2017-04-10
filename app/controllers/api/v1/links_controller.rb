class Api::V1::LinksController < ApplicationController

  def index
    render json: Link.all
  end

  def create
    if current_user
      @user = User.find(current_user.id)
      link = JSON.parse(request.body.read)
      newLink = @user.links.create(title: link['title'], url: link['url'])
      newLink.save
      render json: newLink
    end
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      render json: @link
    else
      render json: @link.errors.full_messages, status: 500
    end
  end

  private
    def link_params
      params.permit(:read)
    end
end
