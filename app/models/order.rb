class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    after_create :send_order_confirmation

    def send_order_confirmation
      UserMailer.order_confirmation(self).deliver_later
    end
  end