class SearchesController < ApplicationController
  skip_before_filter :authorize
  
  def index
  	@cart = current_cart
    if params[:q]
      @results = Product.search(params[:q])
    end
  end
end
