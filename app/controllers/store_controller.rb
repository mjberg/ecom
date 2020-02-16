class StoreController < ApplicationController

  include CurrentCart
  before_action :set_cart

# the order of methods matter. e.g. if I put the coutner method first here it breaks the page. Why is that?

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
