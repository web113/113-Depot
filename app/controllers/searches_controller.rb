class SearchesController < ApplicationController
  
  def index
  	@cart = current_cart
    if params[:q]
    	@query = params[:q]
    	q_item = @query.split(" ")
    	#@results = Product.search(@query)
    	@results = []
    	
    	for item in q_item
    	   @results = @results + Product.search(item)
    	end
        #@results = Product.search(@query)
    end
  end
end