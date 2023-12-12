class CheckoutsController < ApplicationController
  def index
    # if not logged in, redirect to login
    if !current_customer
      redirect_to new_customer_session_path
      return
    end

    # if cart is empty or doesn't exist, redirect to root
    if !session[:cart] || session[:cart].empty?
      redirect_to root_path
      return
    end

    @taxes = ProvinceTax.all
    
    #store selected province in session
    if params[:province]
      session[:province] = params[:province]
    elsif current_customer.province_tax_id
      session[:province] = ProvinceTax.find(current_customer.province_tax_id).name
      redirect_to checkouts_path(province: session[:province])
    end

    @tax = if session[:province] 
      ProvinceTax.find_by(name: session[:province])
    else
      session[:province] = ProvinceTax.first
    end

    if @tax
      # update user's province
      current_customer.province_tax_id = @tax.id
      current_customer.save
    end
  end

  def create
    line_items = []
    total_cents = 0

    session[:cart].each do |value|
        line_items << {
          price_data: {
            currency: 'cad',
            unit_amount: value[1]['product']['price_cents'],
            product_data: {
              name: value[1]['product']['name'],
              description: value[1]['product']['description']
            }
          },
          quantity: value[1]['quantity']
        }

        total_cents += value[1]['product']['price_cents'] * value[1]['quantity']
    end
    
    # Redirect if line items are empty
    if line_items.empty?
      redirect_to root_path
      return
    end

    # add tax to line items and total
    @tax = ProvinceTax.find_by(name: session[:province] || ProvinceTax.first.name)
    pst = (total_cents * @tax.pst).round
    gst = (total_cents * @tax.gst).round
    line_items << {
      price_data: {
        currency: 'cad',
        unit_amount: pst,
        product_data: {
          name: 'PST',
          description: 'Provincial Sales Tax'
        }
      },
      quantity: 1
    }
    line_items << {
      price_data: {
        currency: 'cad',
        unit_amount: gst,
        product_data: {
          name: 'GST',
          description: 'Goods and Services Tax'
        }
      },
      quantity: 1
    }

    total_cents += pst + gst

    # Create a new Stripe session
    @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: line_items,
        mode: 'payment',
        success_url: checkout_success_url(1) + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url(1) + '?session_id={CHECKOUT_SESSION_ID}',
    )

    # Create a new Order if stripe_session_id doesn't exist
    @order = Order.find_by(stripe_session_id: @session.id)
    if @order == nil 
      @order = Order.create(
        status: 'pending',
        stripe_session_id: @session.id,
        total_price_cents: total_cents,
        customer_id: current_customer.id
      )
    end

    # Create order items
    line_items.each do |item|
      if item[:price_data][:product_data][:name] == 'PST' || item[:price_data][:product_data][:name] == 'GST'
        next
      end
      product = Product.find_by(name: item[:price_data][:product_data][:name])
      OrderItem.create(
        order_id: @order.id,
        product_id: product.id,
        quantity: item[:quantity],
        unit_price_cents: item[:price_data][:unit_amount]
      )
    end

    Order.create(status: 'pending', stripe_session_id: @session.id, total_price_cents: total_cents, customer_id: current_customer.id)

    puts @order

    # Redirect to Stripe checkout
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    # Update the order
    @order = Order.find_by(stripe_session_id: @session.id)
    @order.status = 'paid'
    @order.total_price_cents = @payment_intent.amount
    @order.save

    # Clear the cart
    session[:cart] = {}
  end

  def cancel
    # Update the order
    @order = Order.find_by(stripe_session_id: params[:session_id])
    @order.status = 'cancelled'
    @order.save
  end
end