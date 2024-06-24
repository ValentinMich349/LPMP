class AddCityAndUserToEventsWithoutNotNull < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :user, foreign_key: true
  end
end
