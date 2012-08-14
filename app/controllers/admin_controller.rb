class AdminController < ApplicationController
  skip_before_filter :isAdmin

  def index
    @user = User.find_by_id(session[:user_id])
    @cart = @user.cart
    @total_orders = @user.orders.count
  end

end
