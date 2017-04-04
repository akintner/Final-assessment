require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :url, presence: true, :url => true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_uniqueness_of :url


  # def valid_url?(url)
  #   uri = URI.parse(url)
  #   uri.is_a?(URI::HTTP) && !uri.host.nil?
  # rescue URI::InvalidURIError
  #   false
  # end
end
