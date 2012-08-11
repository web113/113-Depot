class AdminController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @cart = @user.cart
    @total_orders = @user.orders.count
  end

end
