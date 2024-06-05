class Product < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    has_many :cart_items
    has_many :carts, through: :cart_items
  end
