ActiveAdmin.register ProvinceTax do
  permit_params :id, :name, :gst, :pst

  index do
    selectable_column
    id_column
    column :name
    column :gst
    column :pst
    actions
  end

  form do |f|
    f.inputs "ProvinceTax Details" do
      f.input :name
      f.input :gst
      f.input :pst
    end
    f.actions
  end

  controller do
    def find_resource
      ProvinceTax.find(params[:id])
    end

    def create
      @province_tax = ProvinceTax.new(permitted_params[:province_tax])
      if @province_tax.save
        redirect_to admin_province_taxes_path
      else
        render :new
      end
    end

    def update
      @province_tax = ProvinceTax.find(params[:id])
      if @province_tax.update(permitted_params[:province_tax])
        redirect_to admin_province_taxes_path
      else
        render :edit
      end
    end

    def destroy
      @province_tax = ProvinceTax.find(params[:id])
      @province_tax.destroy
      redirect_to admin_province_taxes_path
    end
  end
end
