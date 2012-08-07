class HelpController < ApplicationController
  skip_before_filter :authorize

  def index
    @cart = current_cart
  end

end