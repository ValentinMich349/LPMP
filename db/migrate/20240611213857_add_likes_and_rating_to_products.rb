class AddLikesAndRatingToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :likes, :integer
    add_column :products, :rating, :decimal
  end
end
