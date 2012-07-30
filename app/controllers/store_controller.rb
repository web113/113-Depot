class StoreController < ApplicationController
  def index
    @product = Product.all
    @cart = current_cart
  end

end
