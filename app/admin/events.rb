ActiveAdmin.register Event do
  permit_params :name, :description, :price, :start, :end, :city_id, :user_id

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price
    column :start
    column :end
    column :city
    column :user
    actions
  end

  form do |f|
    f.inputs "Event Details" do
      f.input :name
      f.input :description
      f.input :price
      f.input :start, as: :datetime_picker
      f.input :end, as: :datetime_picker
      f.input :city
      f.input :user
    end
    f.actions
  end
end