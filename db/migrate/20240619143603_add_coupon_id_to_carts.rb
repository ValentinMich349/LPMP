class AddCouponIdToCarts < ActiveRecord::Migration[7.1]
  def change
    add_column :carts, :coupon_id, :integer
  end
end
