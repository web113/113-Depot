class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :authorize
  
  protect_from_forgery

  private
    def current_cart
      user = User.find_by_id(session[:user_id])
      cart = user.cart
      cart
    rescue ActiveRecord::RecordNotFound
      if session[:user_id]
        cart = Cart.create(:user_id => user.id)
        cart
      end
    end

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end
  
  protected
    def set_i18n_locale_from_params
	    if params[:locale]
		    if I18n.available_locales.include?(params[:locale].to_sym)
			    I18n.locale = params[:locale]
			else
			    flash.now[:notice] = 
				    "#{params[:locale]} translation not available"
					logger.error flash.now[:notice]
			end
			
		end
	end
	
	def default_url_options
	    { :locale => I18n.locale }
	end
end

