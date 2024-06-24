class ChangeColumnsInOrderItems < ActiveRecord::Migration[7.1]
  def change
    change_column_null :order_items, :product_id, true
    change_column_null :order_items, :event_id, true
  end
end
