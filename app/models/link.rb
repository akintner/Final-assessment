require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :url, presence: true

  validates_uniqueness_of :url


  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
