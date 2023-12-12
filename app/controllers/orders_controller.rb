class OrdersController < ApplicationController

    def index
        if !current_customer
            redirect_to new_customer_session_path
            return
        end

        @orders = Order.where(customer_id: current_customer.id)
    end

    def show
        if !current_customer
            redirect_to new_customer_session_path
            return
        end

        @order = Order.find_by(id: params[:id], customer_id: current_customer.id)
        @order_items = OrderItem.where(order_id: @order.id)
    end
end