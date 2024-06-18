ActiveAdmin.register Product do
    permit_params :name, :price, :description, :image, :category_id, :likes, :rating
  
    index do
      selectable_column
      id_column
      column :name
      column :price
      column :description
      column :category
      column :likes
      column :rating
      actions
    end
  
    filter :name
    filter :price
    filter :category
    filter :likes
    filter :rating
    filter :created_at
    filter :updated_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :price
        f.input :description
        f.input :category
        f.input :likes
        f.input :rating
        f.input :image, as: :file
      end
      f.actions
    end
  end
  