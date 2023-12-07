class IndicesController < ApplicationController
    def index_params
      params.require(:index).permit()
    end

    def index
      @products = Product.all
      @categories = Category.all

      if params[:category].present?
        category = Category.find_by(name: params[:category])
        @products = category.products if category
        @category = category
      end
      
      if params[:search].present?
        @products = @products.where("LOWER(name) LIKE LOWER(:search) OR LOWER(description) LIKE LOWER(:search)", search: "%#{params[:search]}%")
        @search = params[:search]
      end
    end

end
