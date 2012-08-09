class SearchesController < ApplicationController
  
  def index
  	@cart = current_cart
    if params[:q]
      @results = Product.search(params[:q])
    end
  end
end