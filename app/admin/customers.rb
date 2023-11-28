ActiveAdmin.register Customer do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :id, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  index do
    selectable_column
    id_column
    column :email
    column :encrypted_password
    column :reset_password_token
    column :reset_password_sent_at
    column :remember_created_at
    actions
  end

  form do |f|
    f.inputs "Customer Details" do
      f.input :email
      f.input :encrypted_password
      f.input :reset_password_token
      f.input :reset_password_sent_at
      f.input :remember_created_at
    end
    f.actions
  end
end
