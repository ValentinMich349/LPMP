class Product < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    has_many :cart_items
    has_many :carts, through: :cart_items

    has_many :wishlist_items
    has_many :wishlists, through: :wishlist_items


    belongs_to :category
    include PgSearch::Model
    pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }
    validates :likes, numericality: { greater_than_or_equal_to: 0 }
    validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }


  end
