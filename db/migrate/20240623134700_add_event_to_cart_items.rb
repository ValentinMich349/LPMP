class AddEventToCartItems < ActiveRecord::Migration[7.1]
  def change
    add_reference :cart_items, :event, foreign_key: true, null: true
  end
end
