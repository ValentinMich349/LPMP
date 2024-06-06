class AddCloudinaryUrlToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :cloudinary_url, :string
  end
end
