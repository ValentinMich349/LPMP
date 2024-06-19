class RemoveLocalisationFromEvents < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :localisation, :string
  end
end
