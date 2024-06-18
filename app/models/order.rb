class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    after_create :send_order_confirmation


    def self.ransackable_attributes(auth_object = nil)
      %w[created_at id updated_at user_id]
    end

    def send_order_confirmation
      UserMailer.order_confirmation(self).deliver_later
    end
  end