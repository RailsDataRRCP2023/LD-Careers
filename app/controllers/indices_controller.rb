class IndicesController < ApplicationController
    def index_params
      params.require(:index).permit()
    end

    def index
      @products = Product.all
      @categories = Category.all
      @store_info = StoreInfo.last
    end

end
