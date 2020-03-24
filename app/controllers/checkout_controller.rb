class CheckoutController < ApplicationController

  def create

    @cart = Cart.find(params[:cart_id])

    Stripe.api_key = 'sk_test_6EL9yHe00gASQ5yp6ZSXmTzQ'

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: @cart.line_items.map do |i|
        data = {
        name: strip_tags(i.product.title),
        description: strip_tags(i.product.description),
        amount: i.product.price_cents,
        currency: 'usd',
        quantity: i.quantity,
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
    redirect_to '/'
  end

  def strip_tags(string)
    ActionView::Base.full_sanitizer.sanitize(string)
end

end
