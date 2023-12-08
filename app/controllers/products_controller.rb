class ProductsController < ApplicationController
    def index_params
      params.require(:product).permit()
    end

    def index
        @products = ::Product.includes(:category).all
    end

    def show
        @product = ::Product.includes(:category).find(params[:id])
    end

    def add_to_cart
        product = ::Product.find(params[:id])
        session[:cart] ||= {}
        if session[:cart][product.name].present?
            session[:cart][product.name][:quantity] = session[:cart][product.name][:quantity].to_i + 1
        else
            session[:cart][product.name] = {
                quantity: 1,
                product: product
            }
        end
    end

    def remove_from_cart
        product = ::Product.find(params[:id])
        session[:cart].delete(product.name)
    end

    def checkout
        
    end

    def update_quantity_cart
        product = ::Product.find(params[:id])
        session[:cart][product.name]['quantity'] = params[:quantity].to_i
        if session[:cart][product.name]['quantity'] == 0
            session[:cart].delete(product.name)
        end
    end

    def clear_cart
        session[:cart] = {}
    end
end