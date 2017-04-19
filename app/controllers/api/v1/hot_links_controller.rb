 class Api::V1::HotLinksController < BaseController
   def top_ten
      render json: Link.where('updated_at > ?', 24.hours.ago).limit(10)
    end
  end