class StoreController < ApplicationController




   def index
    @count = counter
    @counter_message = "you've been to this page #{@count} times"
    @products = Product.order(:title)
  end

private

  def counter
    if session[:counter].nil?
       session[:counter] = 0
     end
       session[:counter] += 1
     end
   end
