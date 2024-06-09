class Product < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    has_many :cart_items
    has_many :carts, through: :cart_items

    belongs_to :category
    include PgSearch::Model
    pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }
  end
