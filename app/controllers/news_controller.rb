class NewsController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :isAdmin

  def index
    @cart = current_cart
  end

end
