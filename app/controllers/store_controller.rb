class StoreController < ApplicationController
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

# the order of methods matter. e.g. if I put the coutner method first here it breaks the page. Why is that?

   def index
    @count = counter
    @counter_message = "you know you want to - you've been to this page #{@count} times, buy it already"
    @products = Product.order(:title)
    # what is going on here? I'm exposing the proudct variable
    @product = Product
  end

private

def counter
  if session[:counter].nil?
     session[:counter] = 0
   end
     session[:counter] += 1
   end
 end
