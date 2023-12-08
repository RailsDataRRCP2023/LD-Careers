class CheckoutsController < ApplicationController
  def index
    @categories = Category.all
    @taxes = ProvinceTax.all
  end

  def create
    line_items = []

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
    end

    # Redirect if line items are empty
    if line_items.empty?
      redirect_to root_path
      return
    end

    # Create a new Stripe session
    @session = Stripe::Checkout::Session.create(
        payment_method_types: ['card'],
        line_items: line_items,
        mode: 'payment',
        success_url: checkout_success_url(1) + '?session_id={CHECKOUT_SESSION_ID}',
        cancel_url: checkout_cancel_url(1) + '?session_id={CHECKOUT_SESSION_ID}',
    )

    # Redirect to Stripe checkout
    redirect_to @session.url, allow_other_host: true
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @payment_intent = Stripe::PaymentIntent.retrieve(@session.payment_intent)

    # Clear the cart
    session[:cart] = {}
  end

  def cancel
    # The cancel controller method is called if the payment is cancelled.
  end
end