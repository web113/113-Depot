class StoreController < ApplicationController
  skip_before_filter :authorize

  def index
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else
      @product = Product.paginate :page =>params[:page],:per_page => 5
      if session[:user_id]
        @cart = current_cart
      end
    end
  end

end
