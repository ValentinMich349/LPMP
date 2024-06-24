class AddNotNullConstraintToCityAndUserInEvents < ActiveRecord::Migration[7.1]
  def change
    change_column_null :events, :city_id, false
    change_column_null :events, :user_id, false
  end
end
