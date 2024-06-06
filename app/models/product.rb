class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :cloudinary_url, presence: true
  has_many :cart_items
  has_many :carts, through: :cart_items
end
