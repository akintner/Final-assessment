require 'uri'

class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :url, presence: true
  validates_format_of :url, :with => URI::regexp(%w(http https))
  validates_uniqueness_of :title, scope: :user_id
  validates_uniqueness_of :url, scope: :user_id

  private
    # def valid_url?
    #   uri = URI.parse(url)
    #   uri.is_a?(URI::HTTP) && !uri.host.nil?
    # end

    # def validate_url
    #   errors.add(:url, 'This is an invalid URL, please begin all URLs with http:// or https://') unless valid_url?
    # end

end
