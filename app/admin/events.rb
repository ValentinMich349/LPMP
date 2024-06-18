ActiveAdmin.register Event do
    permit_params :name, :description, :price, :start, :end, :localisation, :image_url, :city_id
  
    index do
      selectable_column
      id_column
      column :name
      column :description
      column :price
      column :start
      column :end
      column :localisation
      column :city
      actions
    end
  
    filter :name
    filter :description
    filter :price
    filter :start
    filter :end
    filter :localisation
    filter :city
    filter :created_at
    filter :updated_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :description
        f.input :price
        f.input :start, as: :datetime_picker
        f.input :end, as: :datetime_picker
        f.input :localisation
        f.input :image_url
        f.input :city
      end
      f.actions
    end
  end
  