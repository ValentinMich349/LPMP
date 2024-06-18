class CreateStores < ActiveRecord::Migration[7.1]
  def change
    create_table :stores do |t|
      t.string :name
      t.text :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
