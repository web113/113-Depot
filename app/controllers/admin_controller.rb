class AdminController < ApplicationController
  def index
    @user = User.find_by_id(session[:user_id])
    @total_orders = @user.orders.count
  end

end
