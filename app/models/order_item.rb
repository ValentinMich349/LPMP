class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product, optional: true
  belongs_to :event, optional: true

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
end