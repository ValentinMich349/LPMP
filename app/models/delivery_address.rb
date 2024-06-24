class DeliveryAddress < ApplicationRecord
  belongs_to :user

  validates :address_line1, :city, :state, :zip_code, :country, presence: true
end
