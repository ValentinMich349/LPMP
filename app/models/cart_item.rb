class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product, optional: true
  belongs_to :event, optional: true

  validates :quantity, numericality: { greater_than: 0 }

  validate :product_or_event_present


  def total_price
    (product&.price || event&.price) * quantity
  end


  private

  def product_or_event_present
    if product_id.nil? && event_id.nil?
      errors.add(:base, "Must have either a product or an event")
    end
  end
end
