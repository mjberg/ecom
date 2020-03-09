class CheckoutController < ApplicationController

  def create

    @cart = Cart.find(params[:cart_id])

    Stripe.api_key = 'sk_test_6EL9yHe00gASQ5yp6ZSXmTzQ'

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @cart.line_items.map do |i|
        data = {
        name: i.product.description,
        amount: '400',
        currency: 'usd',
        quantity: '1',
      }
    end,
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
    )

    respond_to do |format|
      format.js # render create.js.erb
    end
  end


  def success
  end

  def cancel
  end
end
