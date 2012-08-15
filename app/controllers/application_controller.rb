class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :authorize
  before_filter :isAdmin
  
  protect_from_forgery

  private
    def current_cart
      if session[:user_id]
        user = User.find_by_id(session[:user_id])
        cart = user.cart
        cart
      else
        return nil
      end
    end

  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, :notice => "Please log in"
    end
  end

  protected
  def isAdmin
    unless User.find_by_id(session[:user_id]).name == "admin"
      redirect_to permission_url
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

