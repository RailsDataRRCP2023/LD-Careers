class CategoryController < ApplicationController
    def index_params
      params.require(:category).permit()
    end

    def index
      @categories = Category.all
    end

    def show
      @category = Category.find(params[:id])
    end
end
