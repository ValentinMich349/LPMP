class AddCityToEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :city, null: false, foreign_key: true
  end
end
