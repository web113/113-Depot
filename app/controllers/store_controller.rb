class StoreController < ApplicationController
  def index
    @product = Product.all
  end

end
