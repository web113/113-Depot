class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    @product = Product.all
    @cart = current_cart
  end

end
