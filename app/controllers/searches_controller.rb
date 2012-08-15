require 'will_paginate/array' 
class SearchesController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :isAdmin
  
  def index
  	@cart = current_cart

    if params[:q].length != 0
    	@query = params[:q]
    	q_item = @query.split(" ")
    	@results = []
      record = [0]
      tag = true
    	
    	for item in q_item
         tempproduct = Product.search(item)
         for product in tempproduct
           for r in record
              if product.id == r
                 tag = false
                 break
              end
           end
           if tag == true
              record << product.id
              @results << product
           end
           tag = true
         end
    	end
      @results = @results.paginate :page =>params[:page],:per_page => 5
      
      if @results.empty?
         @notice = "Oooops, no match. Please try again"
      end
    else
      @results = Product.all
      @results = @results.paginate :page =>params[:page],:per_page => 5
    end
  end
end
