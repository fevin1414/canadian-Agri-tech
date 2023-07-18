class User < ApplicationRecord
  has_secure_password
  has_many :testimonials
  has_many :addresses
  has_many :payments
  has_many :reviews
  has_many :orders
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
