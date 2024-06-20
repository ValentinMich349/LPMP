class Coupon < ApplicationRecord
    validates :code, presence: true, uniqueness: true
    validates :discount, presence: true, numericality: { greater_than: 0 }
    validate :valid_until_in_future
  
    def valid_for_cart?(cart)
      self.valid_until.nil? || self.valid_until > Time.current
    end
  
    private
  
    def valid_until_in_future
      if valid_until.present? && valid_until <= Time.current
        errors.add(:valid_until, "must be in the future")
      end
    end
  end