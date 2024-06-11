class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.datetime :start
      t.datetime :end
      t.string :localisation
      t.string :image_url


      t.timestamps
    end
  end
end
