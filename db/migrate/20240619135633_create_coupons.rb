class CreateCoupons < ActiveRecord::Migration[7.1]
  def change
    create_table :coupons do |t|
      t.string :code, null: false
      t.decimal :discount, precision: 10, scale: 2, null: false
      t.datetime :valid_until

      t.timestamps
    end

    add_index :coupons, :code, unique: true
  end
end
