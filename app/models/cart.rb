class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items

    def self.ransackable_attributes(auth_object = nil)
        %w[created_at id updated_at user_id]
      end

    def total
        cart_items.to_a.sum { |item| item.total_price }
      end
  end