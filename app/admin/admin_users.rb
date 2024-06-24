ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin, :first_name, :last_name, :pseudo

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :pseudo
    column :admin
    actions
  end

  filter :email
  filter :first_name
  filter :last_name
  filter :pseudo
  filter :admin
  filter :created_at
  filter :updated_at
end