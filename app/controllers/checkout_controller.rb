class CheckoutController < ApplicationController

  def create

    @carts = Cart.find(params[:id])

    @session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: []
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
