ActiveAdmin.register Payment do

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
  
  permit_params :id, :payment_date, :amount_cents, :order_id, :payment_method_id
  
  index do
    selectable_column
    id_column
    column :payment_date
    column :amount_cents
    column :order_id
    column :payment_method_id
    actions
  end

  form do |f|
    f.inputs "Payment Details" do
      f.input :payment_date
      f.input :amount_cents
      f.input :order_id
      f.input :payment_method_id
    end
    f.actions
  end
end
