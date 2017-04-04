class Link < ActiveRecord::Base
  belongs_to :user
  
  validates :title, presence: true
  validates :url, presence: true

  validates_uniqueness_of :url
end
