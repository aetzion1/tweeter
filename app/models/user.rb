class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :email, uniqueness: true, presence: true
  validates :username, presence: true, uniqueness: true
  
  has_secure_password
  validates :password, presence: true, allow_blank: false
  validates :password, confirmation: { case_sensitive: true }

end
