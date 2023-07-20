class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
end
