class Cart < ApplicationRecord
    belongs_to :user
    has_many :cart_items, dependent: :destroy
    has_many :products, through: :cart_items
    belongs_to :coupon

    def self.ransackable_attributes(auth_object = nil)
        %w[created_at id updated_at user_id]
      end

    def total
        cart_items.to_a.sum { |item| item.total_price }
      end

      def total_price
        cart_items.includes(:product).sum { |item| item.product.price * item.quantity }
      end
      
      def total_with_discount
        total - (coupon ? coupon.discount : 0)
      end
    
      def apply_coupon(coupon)
        if coupon.valid_for_cart?(self)
          update(coupon: coupon)
        end
      end
  end