ActiveAdmin.register Order do

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
  
    permit_params :id, :order_date, :total_price_cents, :customer_id, :status, :customer_id, :stripe_session_id
    
    index do
      selectable_column
      id_column
      column :order_date
      column :total_price_cents
      column :customer_id
      column :status
      column :stripe_session_id
      actions
    end

    form do |f|
      f.inputs "Order Details" do
        f.input :order_date
        f.input :total_price_cents
        f.input :customer_id
        f.input :status
        f.input :stripe_session_id
      end
      f.actions
    end
end
