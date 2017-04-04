class User < ActiveRecord::Base
  has_secure_password
  has_many :links

  validates :email, presence: true
  validates :password_digest, presence: true

  validates_uniqueness_of :email
end