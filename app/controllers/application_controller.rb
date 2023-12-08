class ApplicationController < ActionController::Base
    before_action :set_common_variables

    def set_common_variables
      @store_info = ::StoreInfo.last
      @cart = session[:cart] || {}
    end
end
