ActiveAdmin.register Product do

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
  
  permit_params :id, :name, :description, :price_cents, :category_id, :image_url

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :price_cents
    column :category_id
    column :image_url
    actions
  end

  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :description
      f.input :price_cents
      f.input :category_id, as: :select, collection: Category.all.map{|c| [c.name, c.id]}
      f.input :image_url
    end
    f.actions
  end

  controller do
    def find_resource
      Product.find(params[:id])
    end

    def create
      @product = Product.new(permitted_params[:product])
      if @product.save
        redirect_to admin_products_path
      else
        render :new
      end
    end

    def update
      @product = Product.find(params[:id])
      if @product.update(permitted_params[:product])
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def destroy
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to admin_products_path
    end
  end
end
