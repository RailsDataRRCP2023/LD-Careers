ActiveAdmin.register PaymentMethod do

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
  
    permit_params :id, :name, :card_number, :expiration_date, :cvv, :customer_id

    index do
      selectable_column
      id_column
      column :name
      column :card_number
      column :expiration_date
      column :cvv
      column :customer_id
      actions
    end

    form do |f|
      f.inputs "PaymentMethod Details" do
        f.input :name
        f.input :card_number
        f.input :expiration_date
        f.input :cvv
        f.input :customer_id
      end
      f.actions
    end
end
