class ChangeColumnsInCartItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :cart_items, :product_id, true
    change_column_null :cart_items, :event_id, true
  end
end
