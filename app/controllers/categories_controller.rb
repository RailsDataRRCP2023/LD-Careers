class CategoriesController < ApplicationController
    def index_params
      params.require(:category).permit()
    end

    def index
      @categories = ::Category.includes(:products).all
    end

    def show
      @category = ::Category.includes(:products).find(params[:id])
    end
end
