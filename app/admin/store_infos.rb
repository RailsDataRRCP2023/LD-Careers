ActiveAdmin.register StoreInfo do
    permit_params :id, :name, :about, :address, :phone, :email, :logo_url

    index do
        selectable_column
        id_column
        column :name
        column :about
        column :address
        column :phone
        column :email
        column :logo_url
        actions
    end

    form do |f|
        f.inputs "StoreInfo Details" do
            f.input :name
            f.input :about
            f.input :address
            f.input :phone
            f.input :email
            f.input :logo_url
        end
        f.actions
    end
    
    
end
